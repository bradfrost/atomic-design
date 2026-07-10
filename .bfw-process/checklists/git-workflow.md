# Git Workflow Checklist (BFW Git Flow)

Quick-reference for day-to-day branch and PR discipline. Full rules live in `AGENTS.md` §9.5.

## Before starting work on any issue

- [ ] Read the issue in full (or the spec amendment, or the bug report)
- [ ] Confirm the issue is labeled with a category (`bfw/*`) and severity (`ship-blocker` / `pre-launch` / `nice-to-have` / `someday-maybe`)
- [ ] Switch to `develop` and pull: `git switch develop && git pull`
- [ ] Cut a branch linked to the issue:
  - `gh issue develop <N> --checkout` (preferred — creates and links), OR
  - `git switch -c feature/<N>-short-slug develop`
- [ ] Confirm you are NOT on `main` or `develop` before typing any code: `git branch --show-current`

## While working

- [ ] Commit early, commit often. Small, scoped commits with clear messages.
- [ ] Use conventional-commit prefixes with **`feature`** spelled out (not `feat`):
  - `feature(scope): ... (#<N>)` — new functionality
  - `fix(scope): ... (#<N>)` — bug fixes
  - `chore(scope): ... (#<N>)` — tooling, deps
  - `docs(scope): ... (#<N>)` — documentation only
  - `refactor(scope): ... (#<N>)` — restructure without behavior change
  - `test(scope): ... (#<N>)` — test additions or fixes
  - `perf(scope): ... (#<N>)` — performance improvement
- [ ] Reference the issue number in every commit message
- [ ] Do NOT force-push shared branches (`main`, `develop`). Feature/fix branches can be rewritten pre-merge if needed.

## When ready for review

- [ ] All tests pass locally (`npm test` or equivalent)
- [ ] Phase 4 guardrails are satisfied (`.bfw-process/checklists/phase-4-build-guardrails.md`)
- [ ] Push the branch: `git push -u origin <branch-name>`
- [ ] Open a PR with `gh pr create --base develop ...`:
  - **Base branch:** `develop` (NOT `main`)
  - **Title:** matches commit convention, e.g., `feature(process): encode Git Flow branch discipline`
  - **Body:** starts with `Fixes #<N>`, includes summary + test plan
- [ ] Review:
  - **Team work:** wait for explicit approval from someone other than the author
  - **Solo work:** re-read the diff one last time on the PR page before merging. The branch + PR ceremony is the deliberate pause. No approval comment required.
- [ ] Merge via `gh pr merge <PR> --squash` or `--merge` per project convention
- [ ] Delete the branch after merge: `git branch -d feature/<N>-slug && git push origin :feature/<N>-slug`

## Releasing (libraries only)

- [ ] On `develop`: confirm all targeted issues are closed and all PRs are merged
- [ ] Cut a release branch from `develop`: `git switch -c release/<version> develop`
- [ ] On `release/<version>`:
  - Bump version in `package.json`
  - Update changelog (if maintained)
  - Run final tests and verify-phase ship gate
  - Make release-only fixes if needed (no new features)
- [ ] Merge `release/<version>` → `main` and tag:
  - `git switch main && git merge --no-ff release/<version>`
  - `git tag v<version>`
  - `git push origin main --tags`
- [ ] Merge `release/<version>` → `develop` so release commits don't get lost:
  - `git switch develop && git merge --no-ff release/<version>`
  - `git push origin develop`
- [ ] Delete the release branch: `git branch -d release/<version> && git push origin :release/<version>`
- [ ] Publish (with owner approval): `npm publish --access public`

## Deploying (apps / websites)

- [ ] On `develop`: confirm all targeted issues are closed and all PRs are merged
- [ ] Phase 5 ship gate passes: `npm run bfw:ship`
- [ ] Merge `develop` → `main`:
  - `git switch main && git merge --no-ff develop`
  - `git push origin main`
- [ ] Netlify (or equivalent) builds from `main` and deploys
- [ ] Confirm the live URL behaves as expected
- [ ] Update `SPEC.md` status: `approved` → `shipped`

## Emergency hotfix

Only for production-critical bugs that can't wait for the normal flow.

- [ ] Cut from `main`: `git switch -c hotfix/<N>-slug main`
- [ ] Do the minimum fix. Small, surgical, well-tested.
- [ ] Merge `hotfix/<N>-slug` → `main` (with tag for libraries)
- [ ] Merge `hotfix/<N>-slug` → `develop` so the fix doesn't regress on next release
- [ ] Delete the hotfix branch
- [ ] Write up what went wrong — file as a `bfw/process` issue for the retrospective

## Push at milestones

- [ ] Push after every meaningful milestone: phase gate, batch of fixes, passing test suite, completed audit
- [ ] If you wouldn't want to redo the work, push it. Unpushed work is invisible and unrecoverable.

## Branch for major surgery

Before starting a large rewrite, migration, or architectural change:

- [ ] Ensure the current branch is stable and pushed
- [ ] Cut a new branch from the current one: `git switch -c feature/<N>-next-phase`
- [ ] The parent branch becomes the rollback point

**When to cut a new branch:**
- Transitioning between process phases (e.g., Phase A done → Phase B migration)
- Starting a rewrite of a major component or subsystem
- Beginning work that will touch >50% of the codebase
- Any change where "revert to before we started this" should be cheap

## Anti-patterns

- ❌ Working on `main` or `develop` directly. Always branch first.
- ❌ Using `feat:` instead of `feature:` in commit messages. Spell it out.
- ❌ Opening PRs against `main` for feature/fix work. Against `develop`.
- ❌ Force-pushing `main` or `develop`.
- ❌ Merging your own PR without an explicit approval comment (even solo).
- ❌ "Small" changes that skip the branch ceremony. The five-second `git switch -c` has saved more work than any other discipline.
- ❌ Branches that don't reference an issue number.
- ❌ Unclear or history-free commit messages. Say what and why, not just what.
- ❌ Accumulating local commits without pushing. Push at milestones.
- ❌ Starting major surgery on a branch that has stable, shippable work. Cut a new branch first.
