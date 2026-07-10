# Phase 6 — Ship & Document

> **Goal:** Get the build into the world and leave behind enough documentation that the next person (including future-you) can pick it up.

## Inputs

- Phase 5 passed (or bypassed by an owner)
- Build artifacts ready to deploy

## Activities

1. **Merge the PRs that Phase 4 work landed on.** Every task in Phase 4 should have been worked on a branch linked to a GitHub issue, per `AGENTS.md` §9.5. Phase 6 is when those branches get reviewed, PR-approved, and merged — **into `develop`**, not directly into `main`. Merged PRs auto-close their referenced issues. Delete the feature/fix branches after merge.
2. **Cut the release to `main`.** Depending on project type (see `AGENTS.md` §9.5.3):
   - **Apps and websites:** merge `develop` → `main` directly. Netlify watches `main`; the merge is the deploy trigger.
   - **Libraries** (Eddie packages, `bfw-process`, etc.): cut a `release/<version>` branch from `develop` for the release prep. On that branch, bump the version in `package.json`, update the changelog, run final tests, make any release-only fixes. Then merge `release/<version>` → `main` with a tag (`git tag v0.2.0 && git push origin v0.2.0`), AND merge `release/<version>` → `develop` so the release commits stay in sync. Delete the release branch.
3. **Deploy.**
   - **Apps and websites:** confirm Netlify build succeeds and the live URL behaves as expected.
   - **Libraries (npm packages):** follow the publish checklist below.
4. **Close remaining tracked issues.** Run `gh issue list --state open --milestone <current>` (or equivalent filter). Every issue targeted at this milestone should be either merged-and-closed or explicitly moved to a later milestone with a comment. No silent carries.
5. **Update docs.**
   - **New recipes** → PR to `eddie-recipes` with a Storybook story. Reference the PR from the closing comment on the `process-finding.md` issue that triggered the extraction.
   - **New patterns or decisions** → update the relevant Notion SOP page.
   - **Stack deviations** → document in the project's `README.md`: what changed, and why.
   - **Spec amendments** → ensure every amendment is captured in `SPEC.md` frontmatter, with references to the issues or PRs that prompted the change.
6. **Capture follow-ups as GitHub issues, not as mental notes.** Any future features, known debt, or "we'll get to it" items → file them immediately using `feature.md`, `bug.md`, or `process-finding.md` with `someday-maybe` or `nice-to-have` severity. Future-you will never remember; future-agent will never find a TODO comment.
7. **Update `SPEC.md` status.** `status: approved` → `status: shipped`.
8. **Process retrospective (mandatory).** The process itself gets audited — not the project. This is how bfw-process improves. Answer these questions and file issues for anything actionable:

   - **What did bfw-process get right?** Which rules, checklists, or phase gates caught real problems or guided good decisions?
   - **What was missing?** Where did the process have no guidance and you had to improvise? What did a human have to call out that the process should have surfaced?
   - **What was friction without value?** Any rules that felt like ceremony without catching real issues?
   - **What should change for the next project?** Concrete improvements — new rules, new checklist items, new template sections, new failure modes.

   For each finding, file an issue against `Brad-Frost-Web/bfw-process` using the `process-finding.md` template with the `bfw/process` label. A project that ships without feeding back into the process is a missed learning opportunity. This step can be brief — even a single issue saying "nothing to improve" — but the question must be asked.

### Publish checklist (library projects)

A release is not shipped until consumers can install it. A version that exists only in git is invisible to every project that depends on it — `npm update` does nothing, version bumps in consumer `package.json` resolve to stale code, and the gap between "released" and "available" can silently grow for months.

After the release branch is merged and tagged:

1. **Verify the package builds cleanly.** `npm run build` exits 0, `dist/` contains expected artifacts.
2. **Verify `package.json` version matches the release tag.** If the tag says `v0.6.0`, `package.json` must say `"version": "0.6.0"`. Mismatches mean the wrong version gets published.
3. **Publish to npm.** `npm publish --access public` for scoped packages, `npm publish` for unscoped. This step requires human involvement — npm credentials, 2FA tokens, and publish permissions cannot be delegated to agents. An agent can prepare the release branch, bump the version, and open the PR, but the `npm publish` command is owner-executed.
4. **Verify on the registry.** `npm view <package>@<version>` must return the new version. If it doesn't, the publish failed silently (npm auth expiry, 2FA timeout, network issue). Don't move on until this passes.
5. **Notify consumers.** If known consumer projects depend on this package (e.g., `eddie-slides` depends on `eddie-design-tokens`), update or comment on the relevant issues in those repos noting the new version is available. This unblocks their upgrade work.

**Why this matters:** The Eddie ecosystem learned this the hard way — `0.25.0` was released in the monorepo but never published to npm, leaving consumers stuck on `0.20.0-pre.0` for months with no path to upgrade. Five minor versions of improvements were invisible to every downstream project. The publish step is the bridge between "we built it" and "anyone can use it."

## Output

- A live, deployed build at the expected URL
- Documentation updated in all the places it needs to be
- Follow-ups captured where future-you will find them
- `SPEC.md` status updated

## Quick mode note

In Quick mode, Phase 6 is **skipped** unless there's a real artifact to ship. If the code was a demo, it gets committed (or not) and the session ends. If it gets promoted to Full later, Phase 6 runs normally.
