---
name: BFW Process Finding
about: A BFW-rule violation or audit finding that needs to be tracked and fixed
title: "[Finding] "
labels: bfw/process
assignees: ''
---

## What's wrong

_Plain-English description of the violation. One sentence, if possible._

## Where

_Files and line numbers. Be specific — "`app/components/Foo.vue:42`", not "somewhere in Foo"._

- `path/to/file.ext:LINE`

## Which BFW rule is violated

_Which rule from `AGENTS.md`, `CLAUDE.md`, or `SPEC.md` is this breaking? Quote the rule verbatim if you can._

- **Source:** <!-- AGENTS.md §2.1 / CLAUDE.md §Component Convention / SPEC.md §Non-goals / etc. -->
- **Rule:** <!-- quote -->

## Severity

Pick one:

- [ ] `ship-blocker` — Phase 5 ship-readiness gate will fail while this is open. Must be fixed or explicitly waived by an owner before shipping.
- [ ] `pre-launch` — Should be fixed before first external launch, but not blocking day-to-day Phase 4 work.
- [ ] `nice-to-have` — Worth doing when there's capacity. Not time-sensitive.
- [ ] `someday-maybe` — Known debt, tracked for completeness but not planned.

## Category

Pick at least one (add labels accordingly):

- [ ] `bfw/eddie` — Eddie Design System compliance (custom components, wrong packages, missing recipes)
- [ ] `bfw/tokens` — Hardcoded design values, missing `--ed-*` tokens
- [ ] `bfw/a11y` — Accessibility baseline violations
- [ ] `bfw/testing` — Missing or inadequate tests
- [ ] `bfw/infra` — Build, deploy, CI, tooling
- [ ] `bfw/docs` — Documentation gaps or drift
- [ ] `bfw/process` — Process / workflow / gating issue
- [ ] `bfw/security` — Security posture (secrets in client, missing validation, etc.)

## Proposed fix

_What specifically needs to happen to resolve this? Bullet the steps. If it's a recipe extraction, name the recipe. If it's a rename, propose the new name. If it's a test, describe the assertion._

-

## Acceptance criteria

_How will we know this is fixed? Testable criteria — "file X no longer contains pattern Y," "test Z passes," "`bfw-process verify-phase ship` exits 0," etc._

-

## Related

_Link any related issues, PRs, SPEC.md sections, or prior discussions._

-

## Dual-filing check (cross-ecosystem)

_Does this finding have an upstream root cause in Eddie or another BFW shared package?_ If so, **file a paired upstream issue** in the appropriate repo (most often `Brad-Frost-Web/eddie-design-system`) and cross-reference it here. The consumer-side issue stays open until both (a) the upstream is resolved AND (b) this consumer has adopted the fix. See `AGENTS.md` §9.4.1 for the full dual-filing protocol.

- [ ] This finding has no upstream cause (local-only)
- [ ] This finding has an upstream cause and I've filed the paired upstream issue: `<owner/repo#N>`
- [ ] Unsure — flagging for reviewer to decide

**Every `eddie-brain` "not found" / "empty result" / "wrong result" must be dual-filed.** No exceptions.

---

*How to work this issue (BFW Git Flow — see `AGENTS.md` §9.5):*

1. Make sure you're on latest `develop`: `git switch develop && git pull`
2. Cut a branch from `develop` linked to this issue:
   - `gh issue develop <this-issue-number> --checkout` (preferred), OR
   - `git switch -c fix/<this-issue-number>-short-slug develop`
3. Do the work. Commit with conventional messages referencing this issue:
   - `feature(scope): ... (#<N>)` for new functionality (note: `feature`, not `feat`)
   - `fix(scope): ... (#<N>)` for bug fixes
   - `chore(scope): ... (#<N>)` for tooling / deps
4. Final commit on the branch may say `Closes #<N>` on its own line.
5. Push the branch: `git push -u origin <branch-name>`
6. Open a PR **against `develop`** (not `main`); body starts with `Fixes #<N>`.
7. Review (explicit approval comment required, even solo). Merge. Delete the branch.
8. For libraries, the release flow takes it from `develop` → `release/<version>` → `main` with a tag. For apps/sites, `develop` → `main` directly when deploy-ready.
