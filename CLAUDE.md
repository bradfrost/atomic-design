# CLAUDE.md — Brad Frost Web Software Creation Process

> **You are Claude Code working in a Brad Frost Web (BFW) project.** Your rules of engagement live in `AGENTS.md` at the repo root. **Read `AGENTS.md` in full on your first tool call this session.** That file is the canonical cross-agent source of truth and supersedes any general habits or defaults you have.
>
> This file exists because Claude Code looks for `CLAUDE.md` specifically. The content is a pointer — the actual rules are in `AGENTS.md` so they never drift between Claude Code, OpenHands, Cursor, Cline, and any other harness.

---

## Quick reference (until you've read `AGENTS.md`)

These are the non-negotiables. They apply in **both** Full and Quick modes:

1. **Eddie Design System is the UI layer.** `@brad-frost-web/eddie-web-components` + `@brad-frost-web/eddie-recipes`. No custom components in consumer projects. No Tailwind/Bootstrap/Material UI/Chakra/shadcn. If Eddie doesn't cover it, you create a recipe in `eddie-recipes`.
2. **Design tokens only.** All values come from `@brad-frost-web/eddie-design-tokens` as `--ed-*` CSS custom properties. No hardcoded colors, spacing, type. No Google Fonts `<link>` tags.
3. **WCAG 2.1 AA accessibility baseline.** Semantic HTML, keyboard-reachable, contrast, alt text, progressive enhancement. a11y during, not after.

## Modes

This project has a mode in `.bfw-process/config.json`:

- **Full mode** — six-phase process enforced. `SPEC.md` must have `status: approved` before Phase 3 begins. Phase 5 → 6 is a hard gate via `npm run bfw:ship`.
- **Quick mode** — phase gates skipped, `SPEC.md` optional, ship checks off. The three non-negotiables above still apply.

## "Do it for real now"

If the user says **"do it for real now"** (or a clear variant like "promote to full" or "run the gauntlet"), it's a mode-switch instruction. Don't rewrite the existing code. Instead:

1. Generate `SPEC.md` from the current state of the working directory using `.bfw-process/templates/SPEC.md`
2. Set `status: draft`, stop, and wait for human approval
3. Once approved, run Phase 3 → 4 → 5 → 6 as refinement of the existing code

If you're on a `design/*` branch and the user says **"let's promote this"**, **"make this real"**, **"spec this out"**, **"let's build this for real now"**, or similar, that's a *design-branch promotion* (not a Quick → Full mode switch). The next move is `bfw-process design promote` — see the "Design branches" section below and AGENTS.md §5.3.

## Design branches

A `design/<N>-<slug>` branch is for exploratory, sketch-first work. Different rules apply:

- **No phase gates while on the branch.** `SPEC.md` not required until promotion. `npm run bfw:ship` will refuse on a design branch.
- **Never merges to `develop`.** Promotion via `bfw-process design promote` produces fresh `feature/*` branches off `develop`; the design branch is archived as a git tag.
- **Eddie-first is still the default**, but the user can invite exploration with phrases like *"don't use Eddie here,"* *"color outside the lines,"* *"dream up a new theme,"* or *"sketch this fresh."* When you hear an exploration trigger, ask one short confirming question — **"Do you want to use Eddie, or color outside the lines?"** — and operate under the confirmed mode for that line of work. Per line of work, conversational, revocable.
- **"Let 'er rip" is NOT an exploration trigger.** It can mean "go, stop asking questions." Only treat phrases that explicitly signal *bypassing Eddie or tokens* as exploration triggers. When in doubt, ask.
- **a11y baseline stays on.** Semantic HTML, keyboard reach, contrast — always.

See AGENTS.md §5.3 for the full design-branch contract.

## The Phase 2 gate (Full mode only)

Do not begin implementation until `SPEC.md` has `status: approved`. If draft, wait. If missing, write it from the template and stop.

## The Phase 5 hard gate

Before shipping, run `npm run bfw:ship` (the canonical invocation; it runs `bfw-process verify-phase ship` via the pinned devDependency). If it exits non-zero, do not deploy. Only BFW co-owners (listed in `.bfw-process/config.json` → `owners`) can bypass with `BFW_OWNER_OVERRIDE=1`, and only on explicit human instruction.

**You must not run `BFW_OWNER_OVERRIDE=1` unilaterally.** Only on explicit owner instruction.

## When in doubt, ask

Unclear spec? Ambiguous project type? Hard-to-parse intent? **Stop and ask.** Don't make consequential decisions unilaterally.

---

## Now read the rest

Your next action should be to read `AGENTS.md` in full, then `SPEC.md` (if it exists), then `.bfw-process/config.json` for the current mode and owner list. After that, proceed with whatever the human asked for.

- `AGENTS.md` — full cross-agent rules
- `SPEC.md` — this project's specification
- `.bfw-process/config.json` — mode, owners, project type
- `.bfw-process/phases/` — expanded guidance for each of the six phases
- `.bfw-process/checklists/` — checklists used by `verify-phase`
