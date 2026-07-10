#!/usr/bin/env node
/**
 * Eddie validation hook for AI agents (Claude Code `PostToolUse` + `Stop`).
 *
 * Installed by `bfw-process init` into `.bfw-process/hooks/` and wired into
 * `.claude/settings.json`. Reads the hook payload on stdin and runs
 * `eddie-brain validate` on the relevant .scss/.ts files. If any file has
 * error-severity violations it BLOCKS (exit 2, reason on stderr) so the agent
 * keeps fixing until clean — no human interjection required. This is the
 * enforcement layer that makes BFW's "Eddie-first, tokens only" real rather
 * than advisory (AGENTS.md §2.1, §2.2, §2.5).
 *
 * - PostToolUse (Write/Edit/MultiEdit): validates the single file just written.
 * - Stop / SubagentStop: validates all changed + untracked .scss/.ts files in
 *   the working tree (only files being actively worked on — never the whole
 *   tree, which may carry pre-migration debt that can't pass yet).
 *
 * Locating eddie-brain: EDDIE_ROOT env, else `.bfw-process/config.json` →
 * `eddieRoot`. If it can't be found the hook fails OPEN (never traps the agent
 * over missing tooling). Portability of the CLI path is tracked in bfw-process.
 */
import { execFileSync } from "node:child_process";
import { existsSync, readFileSync } from "node:fs";
import { resolve } from "node:path";

const VALIDATABLE = /\.(scss|ts)$/;

function allow() {
  process.exit(0);
}
function block(reason) {
  process.stderr.write(reason + "\n");
  process.exit(2);
}

let payload = {};
try {
  payload = JSON.parse(readFileSync(0, "utf8") || "{}");
} catch {
  /* no/invalid stdin → nothing to do */
}

const event = payload.hook_event_name || "";
const cwd = payload.cwd || process.cwd();

// Resolve the Eddie root (holds the .eddie-brain knowledge graph + the CLI).
let eddieRoot = process.env.EDDIE_ROOT || "";
if (!eddieRoot) {
  try {
    const cfg = JSON.parse(readFileSync(resolve(cwd, ".bfw-process/config.json"), "utf8"));
    eddieRoot = cfg.eddieRoot || "";
  } catch {
    /* no config */
  }
}

const brainCli = eddieRoot ? resolve(eddieRoot, "packages/eddie-brain/dist/cli/brain.js") : "";
if (!brainCli || !existsSync(brainCli)) {
  process.stderr.write(
    "[eddie-validate] eddie-brain CLI not found (set EDDIE_ROOT or .bfw-process/config.json eddieRoot); skipping.\n"
  );
  allow();
}

// Collect the files to validate for this event.
let files = [];
if (event === "PostToolUse") {
  const fp = payload.tool_input?.file_path;
  if (fp && VALIDATABLE.test(fp)) files = [resolve(cwd, fp)];
} else if (event === "Stop" || event === "SubagentStop") {
  try {
    const out = execFileSync("git", ["-C", cwd, "status", "--porcelain"], { encoding: "utf8" });
    files = out
      .split("\n")
      .map((line) => line.slice(3).trim())
      .filter((f) => f && VALIDATABLE.test(f))
      .map((f) => resolve(cwd, f));
  } catch {
    /* not a git repo / git unavailable */
  }
}

if (files.length === 0) allow();

// Validate each file; the CLI exits non-zero on error-severity issues.
const failures = [];
for (const file of files) {
  if (!existsSync(file)) continue;
  try {
    execFileSync("node", [brainCli, "validate", file], {
      encoding: "utf8",
      env: { ...process.env, EDDIE_ROOT: eddieRoot },
    });
  } catch (err) {
    failures.push((err.stdout || "") + (err.stderr || ""));
  }
}

if (failures.length === 0) allow();

block(
  "Eddie validation failed — fix before finishing.\n" +
    "BFW rule: Eddie components + recipes + --ed-* tokens only. No custom presentational CSS, " +
    "no raw values, class names must use an ed- prefix (or live in a recipe).\n\n" +
    failures.join("\n")
);
