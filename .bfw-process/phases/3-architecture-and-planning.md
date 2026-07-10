# Phase 3 — Architecture & Planning

> **Goal:** With the spec approved, map the build before executing it. Decompose, sequence, and identify dependencies.

## Inputs

- `SPEC.md` with `status: approved`
- Eddie Design System docs (https://ds.bradfrost.com)
- Any relevant prior BFW repos for patterns

## Activities

1. **Break the spec into tasks.** Decompose into discrete, buildable units. Each task should be shippable or verifiable on its own.
2. **File each task as a GitHub issue.** One issue per atomic unit of work, using `bug.md`, `feature.md`, or `process-finding.md` as appropriate. Apply category and severity labels (see `.bfw-process/checklists/labels.md`). Phase 4 work happens against these issues, not against a doc-level task list.
3. **Inventory Eddie components via `eddie-brain`.** For every UI element in the spec, query `eddie-brain` to find the covering component, recipe, or page:
   - `eddie_search("<natural description>")` for the initial find
   - `eddie_compose_recipe("<intent>")` for whole-UI compositions (dashboard, article, login form, settings page, etc.)
   - `eddie_get_component("<ed-x>")` for the specific component you're about to use — check its props, slots, events, and guidelines
   - `eddie_get_token("<--ed-y>")` for any token you're about to reference
   Do not rely on memory or grep of other BFW repos — eddie-brain is the catalog. Empty results are findings that get dual-filed per `AGENTS.md` §9.4.1.
4. **Identify new recipes needed.** Anything UI that doesn't exist in `eddie-web-components`, `eddie-recipes`, or `eddie-pages` gets a recipe plan. Never plan to write one-off component code in the consumer project. If `eddie_compose_recipe` returned irrelevant or empty results for a common pattern, that's also an upstream issue to file.
5. **Evaluate recipe dependencies.** Determine which recipe tiers and category libraries this project needs, per `AGENTS.md` §2.1.1:
   - **Core recipes** — available by default; confirm the project has `@brad-frost-web/eddie-recipes` as a dependency.
   - **Category recipes** — review the spec for domain-specific needs. Does the project need data visualization? UI documentation components? Token specimen pages? Each category library is an explicit opt-in — include only what the spec requires.
   - **Project-local recipes** — for any compositions identified in step 4 that are too specific to upstream, plan a local recipe directory following Eddie conventions (`ed-r-` prefix, tokens only, a11y baseline).
   
   Document the recipe dependency decisions in this phase's output. If the project's needs don't clearly map to an existing category library, that's a signal to either (a) start project-local and promote later, or (b) file an issue proposing a new category library.
6. **Evaluate third-party library needs.** Review the spec for capabilities outside Eddie's scope — charting, video, drawing, rich text, maps, etc. For each capability gap:
   - Search for candidate libraries that meet the evaluation criteria in `AGENTS.md` §2.1a (Web Component friendly, themeable with Eddie tokens, accessible, right-sized, maintained, SSR-compatible, license-compatible).
   - Evaluate at least 2–3 candidates per capability. Don't default to the most popular option without checking it against the criteria.
   - Decide where the integration lives: Eddie category recipe library, project-local integration, or non-UI utility (see §2.1a integration home table).
   - For non-trivial integrations, plan a proof-of-concept spike as an early Phase 4 task — before the library is wired into the full build.
   - Document each library decision in this phase's output. File Eddie gap issues for any missing tokens, components, or recipes the integration surfaces.
7. **Flag escalations.** Anything outside the default stack (§3 of `AGENTS.md`) needs explicit justification, documented in this phase's output.
8. **Sequence the work.** Order issues by dependency: foundation first, features second, polish third. `ship-blocker` severity before `pre-launch` before `nice-to-have`. Identify the critical path.
9. **Identify test strategy.** What unit tests are needed? What integration tests? What a11y checks? Plan them alongside the build tasks — each test plan is itself an issue or an acceptance-criteria bullet on an existing issue.
10. **Cut feature branches for each in-flight issue** before Phase 4 begins. Per `AGENTS.md` §9.5, every unit of work starts on a new branch from `develop` (`feature/<N>-slug` or `fix/<N>-slug`). No Phase 4 work happens on `develop` or `main` directly.

## The retroactive-audit case

When Phase 3 begins on an existing project (common during Quick → Full mode promotion, or when adopting `bfw-process` into a project that already has code), the first step is a **systematic audit** of the entire codebase against the rules in `AGENTS.md`. This is the most common entry point for bfw-process — most BFW projects have existing code, not a blank slate.

### How to write a SPEC from existing code

The Phase 2 SPEC for a retroactive adoption is written from **observation**, not intent. Read the existing code, its README, its config files, and its git history. Describe what the project **is** and what it's **for** based on what exists — not what you wish it was. The SPEC captures the *intent* the code was trying to achieve, even if the implementation fell short.

Key differences from greenfield:
- **Goals** come from what the code does, refined by what the human says it *should* do
- **Non-goals** are informed by what the code *doesn't* do — and confirmed with the human
- **Open questions** surface gaps between intent and implementation: "the auto-save drops changes — should reliability be a success criterion?"
- **Tech decisions** may include migration plans: "evaluate Nuxt to replace the monolithic Lit shell"

### Running the audit

Use the **retroactive audit checklist** (`checklists/retroactive-audit.md`) to systematically check every category:

1. **Walk through the checklist category by category.** Token compliance, Eddie-first, accessibility, testing, complexity, infrastructure, security, dependency freshness, documentation.
2. **File each violation as its own GitHub issue** using the `process-finding.md` template. One atomic finding per issue. Not a sub-bullet in a list, not a TODO comment — an issue.
3. **Label every issue** with at least one category label (`bfw/eddie`, `bfw/tokens`, `bfw/a11y`, `bfw/testing`, `bfw/infra`, `bfw/docs`, `bfw/process`, `bfw/security`) and exactly one severity label (`ship-blocker`, `pre-launch`, `nice-to-have`, `someday-maybe`). See `checklists/labels.md` for the canonical list.
4. **Dual-file upstream causes.** If a finding has a root cause in Eddie or another BFW package (missing token, missing component, stale package on npm), file both a consumer-side issue AND an upstream issue with cross-references per §9.4.1.
5. **Check dependency freshness.** Run `npm outdated` for `@brad-frost-web/*` packages. Verify the latest versions are published on npm, not just tagged in git.
6. **Record the audit in `SPEC.md`'s `amendments:` frontmatter** as a single entry: `"Retroactive audit filed N findings as issues #X–#Y"`.
7. **Do not keep findings inline in `SPEC.md`.** SPEC.md is forward-looking. Issues carry the punch list.

### Sequencing the remediation

After the audit, sequence the work into two phases:

1. **Phase A — Portable remediation.** Token compliance, a11y, test coverage, CSS naming, linting setup, dependency updates. These fixes are independent of architecture and survive any framework change. They are low-risk, high-value, and independently shippable. Push this work and create a stable branch (§9.5.7).

2. **Phase B — Architectural changes.** Framework migrations, component decomposition, rewrites. Cut a new branch from Phase A. Phase A is the rollback point. If Phase B goes sideways, Phase A's improvements are preserved.

Don't mix portable fixes with architectural surgery. Portable fixes make the codebase measurably better regardless of what happens next. Architectural changes are high-risk and may take multiple iterations.

After the audit and sequencing, Phase 3 proceeds normally: task list, component inventory, recipes list. The task list is informed by the open issues but is not a copy of them — it's the working plan for the current iteration.

## Output

- Ordered task list (as TaskCreate entries, a markdown checklist, or both)
- **For existing projects: a set of GitHub issues filed for every audit finding**, each with category + severity labels
- **For existing projects: a `SPEC.md` amendment entry** recording the audit cohort (e.g., "filed as issues #42–#51")
- Component inventory (Eddie components that cover the spec)
- New recipes list (with issue links to the Eddie monorepo if they should graduate)
- Recipe dependency decisions (which category libraries to include, any project-local recipes planned)
- Third-party library decisions (library name, capability gap, evaluation summary, integration home, Eddie gaps filed)
- Escalations list (non-default stack choices with justification)
- Test strategy summary

## Soft gate

No formal approval required to move from Phase 3 → 4, but the outputs should be visible to the human reviewer (commit the task list, reference it in chat). If the plan is radically different from what the human expected, they should be able to intervene before Phase 4 burns cycles.

## Quick mode note

In Quick mode, Phase 3 is informal. You still mentally identify Eddie components and sequence the work, but you don't have to produce a formal task list or recipe inventory.
