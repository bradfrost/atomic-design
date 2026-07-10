---
name: bfw-process-repo
type: repo
agent: CodeActAgent
---

# BFW Repo Microagent (Always-On)

You are working in a Brad Frost Web project. This microagent loads on every agent session in this repo. The authoritative source for all rules is `AGENTS.md` at the repo root — read it in full on your first turn. This file summarizes the must-know rules so they're in context immediately.

## Non-negotiables (even in Quick mode)

1. **Eddie Design System is the UI layer.** Use `@brad-frost-web/eddie-web-components` and `@brad-frost-web/eddie-recipes`. Never write one-off components in a consumer project. Never use Tailwind, Bootstrap, Material UI, Chakra, or shadcn. If a pattern is missing, create a recipe in `eddie-recipes`.
2. **Design tokens only.** All values come from `@brad-frost-web/eddie-design-tokens` as `--ed-*` CSS custom properties. No hardcoded colors, spacing, type, radii, or shadows. No Google Fonts `<link>` tags.
3. **Accessibility baseline is WCAG 2.1 AA.** Semantic HTML, keyboard-reachable, contrast, alt text, progressive enhancement. a11y during, not after.

## Modes

This project has a mode set in `.bfw-process/config.json` (`full` or `quick`).

- **Full mode:** Six-phase process enforced. `SPEC.md` must have `status: approved` before Phase 3 begins. Phase 5 → 6 is a hard gate via `npm run bfw:ship`.
- **Quick mode:** Phase gates skipped, `SPEC.md` optional, ship-readiness checks off. The three non-negotiables above **still apply**.

## "Do it for real now"

If the human says "do it for real now" (or any clear variant meaning "promote this quick-mode project to Full mode"), don't rewrite the existing code. Instead:

1. Generate `SPEC.md` from the current state of the working directory using `.bfw-process/templates/SPEC.md`.
2. Set `status: draft`. Stop.
3. Wait for human to promote to `status: approved`.
4. Then proceed through Phase 3 → 4 → 5 → 6 as refinement of the existing code.

## The Phase 2 gate

In Full mode, **do not begin implementation** (Phase 3+) until `SPEC.md` has `status: approved` in its frontmatter. If it's `draft`, wait. If it's missing, write it from the template and stop.

## The Phase 5 hard gate

Before shipping, run `npm run bfw:ship` (the canonical invocation; it runs `bfw-process verify-phase ship` via the pinned devDependency). If it exits non-zero, do not deploy. Only BFW co-owners (in `.bfw-process/config.json`'s `owners` array) can bypass via `BFW_OWNER_OVERRIDE=1`, and only on explicit human instruction.

**Agents: do not run `BFW_OWNER_OVERRIDE=1` unilaterally.**

## GitHub issues are the paper trail

Every BFW-rule violation, bug, feature idea, or audit finding goes into the project's GitHub issue tracker using the templates in `.github/ISSUE_TEMPLATE/`. Never write inline punch lists in `SPEC.md`, never bury TODOs in code. The full audit → issue → branch → PR → merge cycle is documented in `AGENTS.md` §9. If you find something wrong, file an issue. If you want to pick up work, `gh issue list --label bfw/<category> --state open`.

## Git Flow branch discipline

BFW uses Git Flow. **Every unit of work starts on a new branch cut from `develop`** (never `main`, never work directly on `develop`). Branch names: `feature/<N>-slug`, `fix/<N>-slug`. PRs go to `develop` first, then `develop` → `main` (apps/sites) or `develop` → `release/<version>` → `main` tagged (libraries). Commit prefixes: `feature:` (spelled out — not `feat:`), `fix:`, `chore:`, `docs:`. Every commit body references the issue: `(#42)`. Final commit on a branch may say `Closes #42`. PRs include `Fixes #42` in the body. **Never work on `main` or `develop` directly.** Full rules: `AGENTS.md` §9.5.

## When in doubt, ask

If the spec is unclear, the project type is ambiguous, or the human's intent is hard to parse, **stop and ask**. Don't make consequential decisions unilaterally.

---

**Read `AGENTS.md` for the full rules. Read `SPEC.md` for this specific project. Check `.bfw-process/config.json` for mode and owners.**
