# AGENTS.md — Brad Frost Web Software Creation Process

> **You are an AI coding agent working on a Brad Frost Web (BFW) project.** This file is the canonical, cross-agent source of truth for how software is built at BFW. Read it in full before writing a single line of code. It supersedes any general habits or defaults you have.
>
> This file works across agent harnesses: Claude Code (`CLAUDE.md`), OpenHands, Cursor, Cline, and any tool that reads `AGENTS.md`. When in doubt, behave as if this file is your only instruction.

---

## 0. What BFW is and why this document exists

Brad Frost Web LLC builds design-system–first web software under the direction of Brad Frost and Ian Frost. BFW has strong, specific opinions about how software should be created — opinions earned through years of client work, teaching, and production hits and misses. This document encodes those opinions so every agent session in a BFW repo starts from the same baseline without a human having to re-explain anything.

**The non-negotiables, in one breath:** spec before build, Eddie is the UI layer, design tokens only, accessibility is a baseline not a stretch goal, tests ship with code, and deviations are documented.

### Foundational dependency: Design System Community Charter

Everything in this document sits on top of the [Design System Community Charter](https://gist.github.com/hereinthehive/bf4053e3721e3395a1b30e30b98a196c) by Dan Donald ([@hereinthehive](https://github.com/hereinthehive)). The charter defines how humans and AI agents collaborate ethically to create, maintain, and evolve design systems. It is the ethical and human-centered foundation beneath BFW's technical rules — the *why* under the *what*.

A snapshot of the charter lives at `.bfw-process/foundations/design-system-community-charter.md`. The canonical, evolving version is the gist linked above. When in doubt, the gist is authoritative.

**What this means in practice:**

- The charter's guiding principles — transparency, respect, learning, stewardship, and inclusion (§4) — are the values that BFW's core principles encode technically. Accessibility isn't just WCAG compliance; it's human dignity (Charter §4.5, §8).
- The agent self-review checklist (Charter §3) applies to all BFW agent work. Before generating examples, documentation, or test data, check for cultural neutrality, inclusive language, and non-assumption.
- The charter's human dignity and non-assumption framework (Charter §8) governs how agents think about the people who will use what we build. We do not assume abilities, identities, circumstances, or contexts.
- Example data, documentation, and test fixtures must follow the charter's inclusive examples guidance (Charter §7.3): diverse names, culturally varied contexts, no Western-centric defaults.

This charter is a living document. BFW will be evolving it further with Dan and a growing community of people and organizations who care deeply about the Web and the trajectory of software development.

---

## 1. Core principles (always on, every mode)

1. **Spec first, build second.** We do not vibe-code into production. We specify, review, then build. Exception: Quick mode (see §5).
2. **Eddie is the UI layer. No exceptions.** Custom HTML/CSS/JS for presentational UI is prohibited. `@brad-frost-web/eddie-web-components` + `@brad-frost-web/eddie-recipes` is the answer.
3. **Simplest stack that satisfies requirements.** No frameworks "because they're cool." Content site → Eleventy. App needing auth/state/realtime → Nuxt. Script → vanilla Node/Python. Component → Eddie monorepo work only.
4. **Accessibility is not optional.** WCAG 2.1 AA is the baseline. Semantic HTML, keyboard navigation, sufficient contrast, ARIA when (and only when) HTML semantics don't cover it.
5. **Tests are part of the build, not an afterthought.** Unit tests are generated alongside code, not after.
6. **Document deviations.** If a project needs to deviate from the defaults, say so in `README.md` and explain why.
7. **Surface, don't assume.** If the spec is unclear on a decision, stop and ask. Don't make consequential choices unilaterally.
8. **Commits are communication.** Small, frequent, clear commit messages describing what changed and why.
9. **Design for human dignity.** The Design System Community Charter (§0) is the ethical foundation beneath these technical rules. Inclusive language, cultural neutrality, non-assumption about abilities/identities/circumstances, and the agent self-review checklist apply to all BFW work.

---

## 2. The always-on rules (even in Quick mode)

These rules are **always enforced**, regardless of mode. They're cheap, habitual, and they're what makes BFW projects recognizable:

> **Design branches (§5.3) are the one exception** — and even then, only Eddie-first and token discipline can be relaxed, only *per line of work*, only when the human invites exploration, and only after the agent confirms with one short question. The accessibility baseline (§2.3) is **never** relaxable on any branch, in any mode. It's too cheap to drop and too expensive to retrofit.

### 2.1 Eddie-first discipline

- **Never** write `<div class="my-custom-card">` with inline or hand-rolled styles. That's a recipe.
- **Never** introduce Tailwind, Bootstrap, Material UI, Chakra, shadcn, or any other component/utility CSS framework. Eddie is the only system.
- **Never** write one-off component code in a consumer project. If Eddie doesn't cover it:
  1. Check `@brad-frost-web/eddie-web-components` for a variant or configuration.
  2. Check `@brad-frost-web/eddie-recipes` for an existing product-specific composition.
  3. If neither exists, create a new recipe in `eddie-recipes`. File an issue in the Eddie monorepo if it should eventually graduate to core components.

#### 2.1.1 Recipe tiers and selection

Not every project needs every recipe. Eddie recipes are organized into three tiers:

| Tier | What it contains | When to include |
|---|---|---|
| **Core recipes** (`@brad-frost-web/eddie-recipes`) | General-purpose compositions used across many BFW projects — card grids, form groups, hero sections, navigation patterns, etc. | Always available. Every BFW project can pull from this package. |
| **Category recipes** | Domain-specific recipe libraries for specialized needs — e.g., UI Documentation (token specimens, typography specimens, system docs), Charts & Graphs (data visualization), etc. | Include when the project's spec calls for that domain. A documentation site pulls in UI Documentation recipes; a dashboard pulls in Charts & Graphs recipes; a marketing site may need neither. |
| **Project-local recipes** | Compositions too specific to one project to justify upstreaming. Still follow Eddie conventions (`ed-r-` prefix, tokens only, a11y baseline) but live in the consumer project's own recipe directory. | When a composition is unique to one project and unlikely to recur elsewhere. |

#### 2.1.2 Selection signals

Use these signals to decide where a recipe belongs:

- **≥2 BFW projects need the same composition** → upstream it to `eddie-recipes` (core).
- **A composition is domain-specific but reusable across projects in that domain** → category recipe library.
- **A composition is unique to one project** → project-local recipe. If it later appears in a second project, upstream it.

When in doubt, start project-local and promote upstream when reuse materializes. Premature upstreaming creates maintenance burden; late upstreaming just means a one-time extraction.

#### 2.1.3 Recipe graduation to core components

A recipe may graduate from `eddie-recipes` to `eddie-web-components` when it meets all of the following:

1. **Used by ≥3 consumer projects.** Reuse is proven, not speculative.
2. **Stable API.** No breaking changes across 2+ releases. The props, slots, and events are settled.
3. **Passes Eddie's component quality bar.** Full a11y compliance, tokens-only styling, documented with Storybook stories, indexed by eddie-brain.
4. **Filed as a graduation proposal** in the Eddie monorepo issue tracker, citing the consumer projects and usage evidence.

Graduation is not automatic — it's a deliberate decision that adds long-term maintenance to the core package. The bar is intentionally high.

### 2.1a Third-party library evaluation

Eddie covers UI composition, but many projects require capabilities Eddie doesn't provide and shouldn't try to — charting, video editing, drawing/canvas, rich text editing, PDF generation, mapping, 3D rendering, audio processing, and so on. When the spec calls for a capability outside Eddie's scope, a third-party library is justified. But the choice of library and where its integration lives are consequential decisions that deserve the same rigor as any other architectural choice in BFW.

#### When a third-party library is justified

A project needs an external library when it requires a **capability** — not just a UI pattern — that doesn't exist in Eddie and wouldn't make sense as an Eddie component. The distinction matters:

- "I need a bar chart" → capability gap. Eddie doesn't render data visualizations. A library is justified.
- "I need a card with a chart in it" → composition gap. The card is Eddie; the chart is a library; the combination is a recipe.
- "I need a styled button" → Eddie covers this. No library needed. Use `ed-button`.

If you're unsure whether something is a capability gap or just a missing recipe, ask.

#### Evaluation criteria

Every candidate library must be evaluated against these criteria before adoption. The goal is to ensure the library integrates cleanly into the BFW ecosystem rather than fighting it.

| Criterion | What to check | Non-negotiable? |
|---|---|---|
| **Web Component friendly** | Must be vanilla JS, Web Component-native, or easily wrappable in Web Components. No framework-coupled libraries (React-only, Vue-only, Angular-only). Eddie is framework-agnostic Web Components; the library must work in that context. | Yes |
| **Themeable with Eddie tokens** | Must support styling via CSS custom properties or a configuration API that can consume `--ed-*` tokens. Colors, typography, spacing should flow from Eddie's token system — no hardcoded values baked into the library's output. | Yes |
| **Accessible** | Must meet WCAG 2.1 AA. Keyboard navigable, screen reader friendly, sufficient contrast. SVG-based output with proper ARIA attributes preferred over canvas-only rendering. Check the library's own a11y documentation and audit its output. | Yes |
| **Right-sized** | Bundle size proportional to the capability it provides. A 500KB charting library for one pie chart is a red flag. Prefer libraries that support tree-shaking or modular imports. | Strongly preferred |
| **Maintained** | Active maintenance, responsive to security issues, not abandoned. Check last commit date, open issue count, release cadence. A library with no releases in 2+ years is a risk. | Strongly preferred |
| **SSR-compatible** | Must work in both Eleventy (static) and Nuxt (SSR/CSR) contexts, or degrade gracefully. Libraries that crash on `window is undefined` during SSR are disqualifying unless the integration can lazy-load client-side only. | Yes for UI libraries |
| **License-compatible** | MIT, Apache 2.0, BSD, or similarly permissive. No GPL, AGPL, or proprietary licenses without explicit owner approval. | Yes |

If a library fails any non-negotiable criterion, it's out — regardless of how popular or feature-rich it is.

#### Where the integration lives

Once a library passes evaluation, decide where its BFW integration code belongs:

| Integration home | When to use it | Example |
|---|---|---|
| **Eddie category recipe library** | The capability is needed by multiple BFW projects and the integration wraps library primitives as Eddie-styled recipes. | A Charts & Graphs recipe library wrapping a charting library as `ed-r-bar-chart`, `ed-r-line-chart`, etc. |
| **Project-local integration** | Only one project needs this capability, or the integration is too experimental to upstream yet. Still follows Eddie conventions (tokens, a11y) but lives in the consumer project. | A video editor integration built for one specific app. |
| **Eddie core component** | Rare. Only when the capability is so fundamental and the integration so stable that it belongs in `eddie-web-components` itself. Must meet graduation criteria (§2.1.3). | Unlikely for most third-party libraries. |
| **Non-UI utility** | The library has no visual output — it's a data processing, computation, or infrastructure concern. Lives in the app's dependencies directly, no Eddie wrapping needed. | A video transcoding library, a PDF parser, a geospatial computation library. |

The default is **project-local integration** until reuse is proven. Promote to a category recipe library when a second project needs it.

#### The evaluation deliverable

When adopting a third-party library, document the decision during Phase 3 (or as a spec amendment if discovered mid-build). The deliverable is:

1. **Library name and version** — what you're adopting.
2. **Capability it provides** — what gap it fills that Eddie can't.
3. **Evaluation against criteria** — a brief pass/fail on each criterion above. Doesn't need to be a formal report, but the reasoning should be traceable.
4. **Integration home** — where the integration code will live and why.
5. **Eddie gaps surfaced** — any tokens, components, or recipes that need to be created or modified to support the integration. File these as Eddie issues per §9.4.1.
6. **Proof-of-concept** — for non-trivial integrations, a working spike showing Eddie token theming and a11y compliance before committing to the library for the full build.

#### Surfacing gaps back to Eddie

Third-party library integration is one of the richest sources of Eddie gaps. When wrapping a library:

- **Missing tokens?** The library needs a color or spacing value Eddie doesn't provide → file an upstream token gap issue.
- **Missing recipe patterns?** The library's output needs to compose with Eddie components in a way no recipe covers → file an upstream recipe request.
- **Missing component variants?** An Eddie component needs a new slot or prop to house the library's output → file an upstream feature request.

Every gap surfaced this way follows the dual-filing pattern in §9.4.1. The consumer-side issue tracks the local workaround; the upstream issue tracks the systemic fix.

### 2.2 Design tokens only

- **Never** hardcode colors, spacing, type, radii, shadows, or any other design value.
- All values come from `@brad-frost-web/eddie-design-tokens` as CSS custom properties prefixed `--ed-*`.
- **Never** use a Google Fonts `<link>` tag. Fonts come from Eddie's token package (`fonts.scss`).
- If a value you need isn't in the token set, that's a token gap — flag it as a GitHub issue in the Eddie monorepo, don't hardcode around it.

### 2.3 Accessibility baseline

- Semantic HTML first. `<button>` for buttons, `<a>` for links, `<nav>` for navigation, headings in order.
- Every interactive element keyboard-reachable and keyboard-operable.
- Color contrast ≥ WCAG AA (4.5:1 for body text, 3:1 for large text and non-text).
- Every image has alt text (or `alt=""` if purely decorative and marked accordingly).
- ARIA only when HTML semantics don't cover the pattern. Never ARIA-first.
- Forms: labels for every input, error messages programmatically associated, focus management on state changes.
- Progressive enhancement: core functionality must work without JS.

### 2.4 Icons

- Icons come from `@brad-frost-web/eddie-icons`. Don't inline random SVGs from the internet.

### 2.5 Use `eddie-brain` as the source of truth for Eddie

The **`eddie-brain` MCP server** is the authoritative, machine-readable catalog of everything in the Eddie Design System: components, tokens, recipes, relationships, and validation rules. Treat it as the first question you ask for anything Eddie-shaped. Don't guess what `ed-card`'s variants are — ask. Don't assume a token exists — look it up. Don't hand-roll a pattern — search for a recipe.

**Any agent session in a BFW project that touches Eddie must use `eddie-brain` before writing markup or making architectural decisions about Eddie components.** Empty or surprising results are themselves findings: they get filed as issues against `Brad-Frost-Web/eddie-design-system` per the dual-filing pattern in §9.4.

#### The eight tools

| Tool | When to call it |
|---|---|
| `eddie_check_health` | **Start of every Eddie-touching session.** Returns totals for components, tokens, recipes, pages, themes, plus learning-loop stats. Make the numbers part of your working context — a system with few recipes has almost no canonical compositions, so expect to compose from primitives (and file issues for missing recipes). |
| `eddie_search` | Natural-language search across components, tokens, recipes, and boilerplates. First stop for "find me a thing for X". Empty results mean either the thing doesn't exist, or the indexer missed it — both are upstream issues. |
| `eddie_get_component` | Look up a specific component by name (`ed-button`, `ed-card`, `ed-r-project-card`). Returns properties, slots, events, intent, guidelines, paths. **Call this before writing any `<ed-*>` markup** so you know what props and slots the component actually supports. "Component not found" = file an upstream issue. |
| `eddie_get_token` | Look up a design token by name (`--ed-theme-color-background-default`, `--ed-spacing-md`). Returns value, tier, category, intent, and which components reference it. "Token not found" plus empty suggestions array = file an upstream issue. |
| `eddie_get_relationships` | Find canonical composition recipes that involve a specific component. Shows what the component composes with. Empty result for a common component = upstream issue (missing `composesWith` metadata). |
| `eddie_compose_recipe` | Natural-language intent → suggested composition. Use for "I need to build a dashboard / a login form / an error state / a card grid". Irrelevant results = either the corpus is thin (common) or the ranker is broken (also possible) — either way, file an upstream issue. |
| `eddie_validate_file` | Validate a `.ts` / `.scss` / `.vue` / `.njk` file for token-usage violations and naming convention issues. **Run this before every commit that touches Eddie code** (Phase 4) and as part of the Phase 5 ship gate. |
| `eddie_suggest_fix` | Given a validation issue type and file location, get a suggested fix. Use after `eddie_validate_file` flags a problem. If the suggestion is wrong or useless, reject it — this feeds the learning loop (`acceptanceRate`, `mostRejectedType`). |

#### Always-on rules for eddie-brain usage

1. **Run `eddie_check_health` at the start of every Eddie-touching session.** Make the health summary part of your working context. It tells you how much to trust the recipe and page corpus before you start composing.
2. **Call `eddie_get_component` before writing markup for any component you haven't used in the last hour.** Not from memory, not from a grep, not from guessing — from the catalog.
3. **Call `eddie_get_token` before using any token whose name you didn't just see in the catalog.** Hardcoded fallbacks (`var(--ed-foo, #something)`) are a sign you skipped this step.
4. **Call `eddie_search` and `eddie_compose_recipe` before hand-rolling any pattern that looks like it should already exist** — live indicators, card grids, empty states, loading states, form groups, pagination, nav, etc. Zero results from both is a gap to file, not a license to roll your own. In BFW, the right response is "create a recipe in `eddie-recipes`" (or at least file an issue asking for one).
5. **Call `eddie_validate_file` before committing any file that touches Eddie.** Phase 4 build guardrails depend on it; Phase 5 ship gate depends on it.
6. **Treat every "not found" / "empty" / "wrong" result as a finding.** File it upstream against `Brad-Frost-Web/eddie-design-system` using the `process-finding.md` template. This is how the Eddie corpus improves — through real usage surfacing real gaps.

#### When eddie-brain is unavailable

If the `eddie-brain` MCP server isn't running in the current session (e.g., a non-BFW agent harness without MCP configured), **stop and tell the human**. Do not proceed with Eddie work based on memory or inference. Either the agent harness needs to be reconfigured to connect eddie-brain, or the work needs to pause until a human can ground-truth what's in Eddie. BFW work without eddie-brain is guessing.

### 2.6 Component complexity discipline

Components grow one feature at a time and nobody notices the cliff. Use these thresholds as smell detectors — not hard lint rules, but signals that trigger a conversation:

| Signal | Threshold | Action |
|---|---|---|
| **Single-file length** | > 500 lines | **Review:** can any concern be extracted into a helper, mixin, or child component? |
| **Single-file length** | > 1,000 lines | **Flag:** file a `process-finding` issue. Decomposition plan required before further feature work on this component. |
| **Distinct responsibilities** | > 3 in one component | **Review:** a component that handles layout, data fetching, navigation, AND state management is doing too many jobs. Each of those is a candidate for extraction. |
| **Render method / template complexity** | > 100 lines or > 3 conditional branches at the top level | **Review:** consider extracting sub-templates or child components for readability. |

**What counts as a "distinct responsibility":** rendering/layout, data fetching/transformation, navigation/routing, state management, user input handling, animation/transition orchestration, external API coordination. If a component touches more than three of these, it's an orchestrator that should be delegating.

**The test:** Can you describe what this component does in one sentence without using "and"? If not, it's doing too many things.

These thresholds apply to all component types: Eddie core components, recipes, and application components in consumer projects. They apply regardless of framework — Lit, Nuxt/Vue, or plain Web Components.

**What to do when you hit the flag threshold:**

1. File a `process-finding` issue with the component name, line count, and a list of its distinct responsibilities.
2. Do not add new features to the component until a decomposition plan exists.
3. The decomposition plan can be as simple as "these 3 responsibilities become 3 child components" or as involved as "this component becomes a Nuxt page layout with composables." The plan lives on the issue.
4. Existing code continues to work — this is not a "stop everything" rule. It's a "stop growing" rule.

### 2.7 Migration discipline: rebuild the spirit, not the bugs

When adopting `bfw-process` into an existing codebase, or when rewriting/migrating a subsystem, the existing code is a **requirements document, not a template**.

1. **Read the existing code for intent, not for implementation.** What was the author trying to accomplish? That's what you rebuild. How they accomplished it — especially if it's buggy, fragile, or fighting the framework — is not a blueprint.
2. **Don't port bugs.** If the old auto-save dropped changes, the new auto-save doesn't get to drop changes. If the old implementation exposed API keys in the browser, the new one doesn't get to expose API keys. A migration that faithfully reproduces bugs defeats its own purpose.
3. **Don't port incomplete features.** If a feature was half-implemented, either implement it properly or cut it. Half-working code in a new architecture is worse than no code — it creates the illusion of functionality while hiding the gap.
4. **Don't port patterns that fight the new framework.** A 7,755-line Lit component that handles routing, state, persistence, and rendering is reasonable (if oversized) in vanilla Lit. Porting that structure into Nuxt — which has pages, composables, and server routes — would be architectural malpractice. Let the new framework's idioms guide the decomposition.
5. **Use the old code as a requirements document, not a template.** Read it to understand what features exist, what edge cases are handled, what the data model looks like. Then close the file and build it fresh.

### 2.8 Dependency freshness

Before starting work in any BFW project, check that Eddie packages are current:

```bash
npm outdated @brad-frost-web/eddie-design-tokens @brad-frost-web/eddie-web-components @brad-frost-web/eddie-recipes @brad-frost-web/eddie-icons
```

- All `@brad-frost-web/*` dependencies should be on the latest stable version.
- No pre-release versions (`-pre.0`, `-beta`, `-rc`) in production dependencies unless intentional and documented.
- Verify the latest versions are actually published on npm (`npm view <pkg> version`), not just tagged in git. A release that only exists in git is not available to consumers.
- If a package is behind, file an issue and update before building on stale foundations. Building features on top of outdated dependencies means porting forward problems that are already fixed upstream.

---

## 3. Default stack

Start here unless the `SPEC.md` in this repo says otherwise. Deviations must be documented.

| Layer | Default |
|---|---|
| UI components | Eddie Design System (`@brad-frost-web/eddie-web-components`) |
| Product-specific UI | Eddie Recipes (`@brad-frost-web/eddie-recipes`) |
| Design tokens | `@brad-frost-web/eddie-design-tokens` |
| Icons | `@brad-frost-web/eddie-icons` |
| Content / CMS sites | Eleventy (11ty) |
| Apps (auth / state / realtime) | Nuxt |
| Scripts / automation | Vanilla Node.js or Python |
| Hosting | Netlify |
| Languages | Vanilla HTML + CSS + JS; no framework unless justified |
| Version control | GitHub (`Brad-Frost-Web` org) |
| Accessibility target | WCAG 2.1 AA |

### Nuxt escalation signals

Only reach for Nuxt when at least one of these applies:

- Authentication or user sessions
- Heavy client-side state management
- Deep database integration
- Real-time features or complex API orchestration

If **none** of these apply, the answer is **Eleventy + Eddie**. "Future-proofing" is not a Nuxt signal.

---

## 4. The Six Phases

BFW software moves through six phases. Each phase has an output. Phase transitions are **soft gates** (you read the checklist and self-verify) except for **Phase 5 → Phase 6**, which is a **hard gate** enforced by `npm run bfw:ship` (which runs `bfw-process verify-phase ship` via the project's pinned devDependency).

| # | Phase | Output | Gate |
|---|---|---|---|
| 1 | Understand & Scope | Confirmed project type, scope, clarifying decisions | soft |
| 2 | Specification | `SPEC.md` with `status: approved` | soft (but required) |
| 3 | Architecture & Planning | Ordered task list, component inventory, new recipes list | soft |
| 4 | Build | Working code, tests alongside | soft |
| 5 | Test & Verify | Checklist passed (`verify-phase ship`) | **HARD** |
| 6 | Ship & Document | Deployed, docs updated, follow-ups captured | soft |

Full details of each phase live in `.bfw-process/phases/` in the consumer project (or `phases/` in this canonical repo). The Phase 5 → 6 hard gate is implemented by `bfw-process verify-phase ship`, exposed in every scaffolded project as `npm run bfw:ship` (pinned via `devDependencies`). See §7 for bypass policy.

### 4.1 The SPEC.md gate (Phase 2 → Phase 3)

When a BFW project is in **Full mode**, you **must not** begin implementation until `SPEC.md` exists and has `status: approved` in its frontmatter. If it says `draft`, stop and wait for a human to approve it. If it's missing, your first job is to write it using the template in `.bfw-process/templates/SPEC.md`.

If the spec is ambiguous on a decision, ask — don't guess. If the spec changes after Phase 4 has begun, record the change in the `amendments` array in the frontmatter.

---

## 5. Modes and design branches

BFW projects have two operational modes (Full and Quick) plus a special branch type (design branches) that runs under exploration rules regardless of the project mode. The project mode lives in `.bfw-process/config.json` under the `mode` key.

### 5.1 Full mode (`mode: "full"`)

The default. The six-phase gauntlet is in effect. Spec before build. Phase gates respected. Ship-readiness checks enforced. Tests alongside code. Documentation at the end.

### 5.2 Quick mode (`mode: "quick"`)

For teaching, demos, live-coding, podcasts, and prototypes where **speed and immediacy matter more than rigor**. In Quick mode:

- **No phase gates.** Move directly to building.
- **`SPEC.md` is optional.** Don't write one unless explicitly asked.
- **No Phase 5 checklist.** No automated a11y audits, no Lighthouse gate, no ship-readiness verification.
- **No documentation phase.** Skip the Phase 6 doc work unless asked.
- **But §2 rules stay on.** Eddie-first, design tokens only, and the a11y baseline are **not** relaxed. They're muscle memory and they're cheap. A quick demo in BFW still looks like BFW.

Quick mode is for situations where interrupting the flow to write a spec would destroy the value of the moment (e.g., live on a podcast, answering a student's question in real time, sketching an idea before it evaporates).

### 5.3 Design branches

A **design branch** is a branch type, not a project mode. Where Quick mode is the project-wide "skip the rules" setting for teaching and demos, a design branch is a *branch-local* exploration space inside an otherwise rigorous Full-mode project. It's the first half of the double diamond: divergent, sketch-first, "what could this even be?" Feature branches are the second half: convergent, "let's build it for real."

Design branches are named `design/<N>-<slug>` (where `<N>` is the issue number — see §9.5.2), branched from `develop`, and **never merge to `develop`**. When the exploration matures, the branch is *promoted* into one or more `feature/*` branches via `bfw-process design promote` (see below). The design branch itself is archived as a git tag for historical reference and is not part of the production line.

**On a design branch, regardless of project mode:**

- **No phase gates.** Same as Quick mode — move directly to sketching.
- **`SPEC.md` is not generated until promotion.** Don't write one preemptively. Don't nag.
- **No Phase 5 ship gate.** `npm run bfw:ship` on a design branch must refuse to run, with a clear pointer to `bfw-process design promote`.
- **Eddie-first is still the default.** Reach for `ed-*` components, `--ed-*` tokens, and existing recipes first, just like on any other branch.
- **a11y baseline stays on.** Semantic HTML, keyboard reach, contrast, alt text — always. Non-negotiable on every branch.
- **Eddie discipline can be relaxed *per line of work* when the human invites exploration.** If the human says something that signals exploratory intent — examples: *"don't use Eddie here,"* *"color outside the lines,"* *"dream up a new theme,"* *"sketch this fresh,"* *"create something new and weird,"* *"let me see what's possible"* — the agent confirms with one short question and then operates under the confirmed mode for that line of work. The canonical confirming question is: **"Do you want to use Eddie, or color outside the lines?"** Do not invent multi-step ceremonies; one yes/no question is the entire protocol.
- **The license is conversational, per line of work, and revocable.** It does not extend across sessions silently. If the next session starts and the human hasn't reinvited exploration, the default is back on. If the human later says "okay, let's bring this back to Eddie," tighten back up immediately.
- **"Let 'er rip" is NOT an exploration trigger.** It can mean other things (e.g., "go, stop asking questions"). Only treat phrases that explicitly signal *bypassing Eddie or token discipline* as exploration triggers. When in doubt, ask.

**Promotion (`bfw-process design promote`):**

When the exploration is ready to become real work, the agent (or human) runs `bfw-process design promote` on the design branch. The command:

1. Validates that the current branch matches `design/*`.
2. Tags `archive/design-<N>-<slug>` and pushes the tag — the design branch tip becomes a permanent reference artifact.
3. Generates a draft `SPEC.md` from the working tree, pre-filled with what it can infer from the exploration.
4. **Drafts** a cohort of GitHub Issues representing every deviation surfaced during exploration: hand-rolled patterns become `recipe-request.md` issues; hardcoded values become token-gap issues against `eddie-design-system`; missing Eddie components become upstream issues — all dual-filed per §9.4.1, all cross-referenced back to the archive tag.
5. **Shows the human a summary and asks for confirmation before filing anything.** Auto-filing the entire cohort without human review would spam the tracker — the human stays in the loop as the gatekeeper.
6. On confirm: writes the draft SPEC.md, pushes the archive tag, files the issue cohort, and records a `SPEC.md` amendment naming the cohort (mirroring §9.4.3).
7. Stops. Waits for the human to approve the draft SPEC.md (Phase 2 gate).
8. Once approved, work splits into one or more `feature/<N>-*` branches **built fresh from `develop`**, using the archived design branch as a requirements doc per §2.7 ("rebuild the spirit, not the bugs"). The design branch is never merged into develop.

**What design branches are NOT:**

- Not a way to ship code that bypassed the ship gate.
- Not a permanent home for prototypes that should have become features (the promotion step is the cleanup boundary — use it).
- Not an excuse to abandon a11y or to write inaccessible markup "just for now."
- Not a way to avoid filing issues — the promotion step is *more* issue-filing than a feature branch, not less.

### 5.4 Promoting Quick → Full ("do it for real now")

If a human says any of the following in a session — **"do it for real now"**, **"let's do this for real"**, **"promote to full"**, **"run the gauntlet"** — or if `.bfw-process/config.json` flips from `quick` to `full`, you enter promotion mode:

1. **Do not delete or rewrite the quick-mode code.** It's the starting point.
2. **Generate a `SPEC.md`** from the current state of the working directory. Treat the existing code as the implicit spec. Fill in the template. Set `status: draft`.
3. **Stop and wait for approval.** Do not proceed to Phase 3 until a human promotes the spec to `status: approved`.
4. **Once approved, run Phase 3 retroactively.** Break the existing code into tasks, identify any Eddie gaps, identify any recipe work that snuck in as one-off code and needs to be extracted, flag any deviations from the default stack for documentation.
5. **Run Phase 4 as refinement.** Fill in missing tests, replace any one-off UI with Eddie components or new recipes, add missing a11y affordances, fix token violations.
6. **Run Phase 5 normally.** The hard gate applies in full force.
7. **Phase 6 as usual.**

The user can also flip modes deterministically via the CLI:

```bash
bfw-process mode full   # promote
bfw-process mode quick  # demote
```

If there is any ambiguity about whether a "do it for real" phrase is an actual mode switch or just a figure of speech, **ask**. This is a consequential decision.

---

## 6. Deciding project type (Phase 1)

Four possible project types. Pick one at the start:

- **Content / CMS site** → Eleventy + Eddie + Netlify. Most BFW projects land here.
- **App with auth, state, or real-time** → Nuxt + Eddie + Netlify. Must match at least one Nuxt escalation signal from §3.
- **Component or recipe** → Eddie monorepo work only. Do not create a consumer project for this.
- **Script or automation** → Vanilla Node.js or Python. No UI framework. Skip most of the UI-centric rules.

If the project type isn't obvious from the brief, **ask**.

---

## 7. Owner bypass and the ship-readiness hard gate

The Phase 5 → Phase 6 transition is enforced by `bfw-process verify-phase ship`. Every project scaffolded by `bfw-process init` exposes this as `npm run bfw:ship`, backed by the version of `@brad-frost-web/bfw-process` pinned in `devDependencies`. **Run the gate via `npm run bfw:ship`** so CI, collaborators, and local runs all resolve to the same pinned version. The gate exits non-zero on any failed check (tests, a11y, responsive spot-check, spec-flow verification). The agent **must not** ship if this command fails.

### Bypass policy

Co-owners of BFW (currently **Brad Frost** and **Ian Frost** by default, plus anyone explicitly added to the `owners` array in `.bfw-process/config.json`) can bypass the hard gate in emergencies:

```bash
BFW_OWNER_OVERRIDE=1 npm run bfw:ship
```

The bypass succeeds only when:

1. `BFW_OWNER_OVERRIDE=1` is set, **and**
2. The current git `user.email` matches an entry in `owners[].email` in `.bfw-process/config.json`.

Every bypass is logged to `.bfw-process/overrides.log`.

**If you are the agent, do not run `BFW_OWNER_OVERRIDE=1` unilaterally. Only run it if a human who is an owner has explicitly asked you to bypass.** This is non-delegable authority.

Non-owners have no bypass. If they hit the gate, they fix what failed.

---

## 8. Guardrails during build (Phase 4)

Reiterating the rules from §2 because Phase 4 is where they most often get violated:

- No custom presentational CSS. If a style need isn't met by Eddie tokens or components, it's a recipe.
- No hardcoded color, spacing, or type values. Only `--ed-*` tokens.
- No Google Fonts `<link>`. Fonts come from Eddie.
- Accessibility at every step, not as a cleanup task.
- Progressive enhancement: core functionality must work without JS.
- Tests alongside code, not after.
- Commit frequently with clear messages.

---

## 9. The audit / issue / PR cycle

**GitHub Issues are BFW's canonical paper trail.** Every BFW-rule violation, every bug, every feature idea, every audit finding goes into the issue tracker of the project it affects. Inline punch lists in `SPEC.md`, TODO comments in code, and "we should fix that someday" remarks in chat are all anti-patterns — they hide work from future humans and future agents, and they make it impossible to parallelize or delegate.

### 9.1 The cycle

```
audit / find violation
      ↓
file GitHub Issue   ← use a BFW-provided issue template
      ↓
`gh issue develop <N> --checkout`   ← creates a branch linked to the issue
      ↓
do the work, commit referencing the issue
      ↓
open PR with "Fixes #<N>" in the body
      ↓
review, merge   ← issue auto-closes
```

This cycle applies to **every unit of work** in a BFW project. Humans and agents both work from the same queue, with the same conventions, and the same paper trail. Any agent session can run `gh issue list --label bfw/eddie --state open` and pick up work autonomously.

### 9.2 Issue templates

Every BFW project's `.github/ISSUE_TEMPLATE/` ships with (installed by `bfw-process init`):

- **`process-finding.md`** — for BFW-rule violations and audit findings (Eddie-first, tokens, a11y, testing, etc.). This is the template you use for every item the audit surfaces.
- **`bug.md`** — standard bug report with severity and category.
- **`feature.md`** — feature request with a BFW-compatibility checklist.
- **`recipe-request.md`** — a new Eddie recipe is needed for a pattern that doesn't exist yet.
- **`spec-amendment.md`** — a `SPEC.md` change after Phase 4 has begun.

### 9.3 Labels

Standard BFW labels (documented in `.bfw-process/checklists/labels.md`) are:

- **Category:** `bfw/eddie`, `bfw/tokens`, `bfw/a11y`, `bfw/testing`, `bfw/infra`, `bfw/docs`, `bfw/process`, `bfw/security`
- **Severity:** `ship-blocker`, `pre-launch`, `nice-to-have`, `someday-maybe`

Every BFW issue gets at least one category label and exactly one severity label. `ship-blocker` issues block the Phase 5 ship gate.

### 9.4 Retroactive audits, SPEC.md, and cross-ecosystem dual-filing

When you audit an existing project (common during Quick → Full mode promotion), you will find a batch of violations. **Do not write them as an inline list in `SPEC.md`.** Instead:

1. File each finding as its own issue using `process-finding.md`.
2. Add an entry to `SPEC.md`'s `amendments:` frontmatter array: `{date, author, summary: "Retroactive audit filed N findings as issues #X–#Y"}`.
3. Leave a single reference line in `SPEC.md` that points at the filtered issue list, e.g.: `See [open audit findings](https://github.com/org/repo/issues?q=is%3Aissue+label%3Abfw%2Fprocess)`.
4. SPEC.md stays forward-looking (what the project **is**); the issue tracker carries the historical punch list (what's wrong and what's being done about it).

#### 9.4.1 Cross-ecosystem dual-filing

Many audit findings in a BFW consumer project have an **upstream root cause** in a shared BFW package — most commonly `Brad-Frost-Web/eddie-design-system`, but also `bfw-process` itself or any other shared package. When you find one of these:

**File the issue in BOTH places, with cross-references in both bodies.**

- The **consumer-side issue** describes the local symptom, names the specific files/lines, and is the actionable unit for fixing the consumer's code. Its body includes a line like: `Upstream: Brad-Frost-Web/eddie-design-system#472 — blocked on this.` The consumer issue stays open until (a) the upstream is resolved AND (b) the consumer has adopted the fix, OR the consumer explicitly works around it with a documented deviation.
- The **upstream issue** describes the gap or bug at the source — the missing component, the broken parser, the empty recipe corpus, the undefined token. Its body includes an Attribution line: `Surfaced by bfw-process audit pattern during audit of Brad-Frost-Web/<consumer>#<N>.` It may additionally list multiple consumer issues under a "Consumers:" section as more projects hit the same gap.

**Decision rule for dual-filing:**

Ask: *"Is this finding a symptom of something that should exist or work differently in the upstream package?"*

- **Yes** → file both. Example: `tools-dashboard/src/index.njk` hand-rolls a pulsing-dot live indicator. The local symptom is "custom CSS in a consumer project" (consumer-side issue). The upstream cause is "no `live-indicator` recipe exists in `eddie-recipes`" (upstream issue). Both are real; both need tracking; fixing only the consumer side leaves the next project to reinvent the wheel.
- **No** → file locally only. Example: a consumer forgot to run `bfw-process verify-phase ship` before deploying. That's a local process gap; there's no upstream fix.

**Every eddie-brain "not found" / "empty" / "wrong" result falls under dual-filing.** If `eddie_get_component` returns not-found for a component the consumer is actually using, that's both a consumer-side "watch out, this component has no docs" note AND an upstream "indexer missed this component" issue.

#### 9.4.2 Issue body conventions for dual-filed pairs

- **Consumer issue body** MUST include a `Related` or `Upstream` section with the upstream issue URL.
- **Upstream issue body** MUST include an Attribution line naming the consumer repo and issue number, and MUST include the consumer URL under `Related`.
- Use GitHub's `#N` shorthand for same-repo references; use full `owner/repo#N` for cross-repo references.
- When the upstream is resolved and the consumer adopts the fix, comment on the consumer issue with the PR reference and close it.

#### 9.4.3 Audit cohort amendments

When a single audit session files multiple dual-filed pairs, record the cohort in the consumer's `SPEC.md` amendment:

```yaml
amendments:
  - date: 2026-04-11
    author: Brad Frost
    summary: |
      Retroactive audit filed 10 local findings as Brad-Frost-Web/tools-dashboard#2–#10
      and 11 upstream findings as Brad-Frost-Web/eddie-design-system#472–#482.
      Dual-filed pairs: tools-dashboard#3 ↔ eddie-design-system#478/#479;
      tools-dashboard#4 ↔ eddie-design-system#473/#474.
```

The amendment captures both cohorts in one entry, names the dual-filed pairs, and leaves the issue tracker as the live source of truth for everything else.

### 9.5 Git Flow branch model

BFW uses [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/), with per-project-type variations. This is non-optional. **Every unit of work starts on a new branch** — never on `main` and never on `develop` directly. The branch-first discipline is the cheap insurance policy that lets you recover from mistakes: if the work goes sideways, `git switch main && git branch -D feature/foo` is a full reset with zero consequences beyond the branch. The `CLAUDE.md`-recovery incident that prompted this section is the canonical cautionary tale: working directly on tracked-but-uncommitted state with no branch to abandon is how small mistakes become ugly.

#### 9.5.1 Standing branches

| Branch | Purpose | Who merges to it |
|---|---|---|
| `main` | Production / released code. Every commit on `main` is either a tagged release (libraries) or a deployable state (apps/sites). | Merged to from `develop` (apps/sites) or `release/*` (libraries), and `hotfix/*` for emergencies. |
| `develop` | Integration branch for the next release. All feature and fix work merges here first. | Merged to from `feature/*`, `fix/*`, and `release/*` (after release prep is done). |

Both `main` and `develop` are long-lived. Never delete them. Never force-push them.

#### 9.5.2 Working branches

| Prefix | Branches from | Merges to | Lifetime |
|---|---|---|---|
| `feature/<slug>` | `develop` | `develop` | Short-lived; delete after merge |
| `fix/<slug>` | `develop` | `develop` | Short-lived; delete after merge |
| `design/<slug>` | `develop` | **Never merges** — archived as `archive/design-<N>-<slug>` on promotion; production work splits into fresh `feature/*` branches off `develop`. See §5.3. | Short-to-medium; archived after promotion |
| `release/<version>` | `develop` | `main` AND `develop` (libraries only) | Temporary; delete after release |
| `hotfix/<slug>` | `main` | `main` AND `develop` | Rare, emergency only |

Branch slugs should reference the issue number and a short description: `feature/42-stat-card-recipe`, `fix/58-typeahead-debounce`, `design/46-gallery-grid-explore`, `release/0.2.0`, `hotfix/71-bluesky-auth-regression`.

#### 9.5.3 Flow by project type

**Apps and websites** (Content Brain, bfw-pulse, marketing sites):

```
feature/*  →  develop  →  main
fix/*      →  develop  →  main
hotfix/*   →  main     →  main + develop
```

No release branches. `develop → main` merges are the deploy trigger. Netlify watches `main`.

**Libraries** (Eddie core packages, bfw-process itself):

```
feature/*  →  develop  →  release/<version>  →  main (tagged)
fix/*      →  develop  →  release/<version>  →  main (tagged)
hotfix/*   →  main     →  main + develop
```

Release branches exist to stabilize a version: dep bumps, version-number commit, changelog, final testing. No new features land on a release branch — only release-related fixes. On merge to `main`, the release commit gets a tag (`v0.2.0`). The release branch then merges back into `develop` so those release-prep changes don't get lost.

**Recipes / components in the Eddie monorepo** follow the library flow above.

**Scripts / automation** (small internal tooling) may use a simplified flow: `feature/*` → `main` directly, with no `develop`. This is a deviation and must be documented in the project's `README.md`.

**Design branches** apply to all project types that have a `develop` branch (apps, websites, libraries, recipes). They branch off `develop` and never merge back — promotion is to fresh `feature/*` branches, not a merge. The design branch becomes an archive tag. Scripts/automation projects on the simplified `feature/* → main` flow don't get design branches; if exploratory work is needed there, sketch in a `feature/*` branch and rebuild fresh from `main` if the sketch survives.

#### 9.5.4 Commit message conventions

Use the conventional-commits style with **`feature`** spelled out (not `feat`), and these allowed types:

- `feature(scope): ...` — new functionality
- `fix(scope): ...` — bug fix
- `chore(scope): ...` — tooling, deps, non-functional housekeeping
- `docs(scope): ...` — documentation only
- `refactor(scope): ...` — code restructure without behavior change
- `test(scope): ...` — test additions or fixes
- `perf(scope): ...` — performance improvement
- `style(scope): ...` — formatting only (rare — prefer auto-formatters)

**Every commit that fixes a tracked issue references it:**

- `feature(recipes): extract stat-card recipe (#42)`
- `fix(init): preserve existing files by default (#67)`
- `chore(deps): bump nuxt to 4.5.1 (#84)`

The final commit on a branch that closes an issue may end with `Closes #42` on its own line. PRs reference issues in the body with `Fixes #42` which auto-closes on merge.

#### 9.5.5 PR conventions

- **Base branch:** always `develop` for `feature/*` and `fix/*`. Never `main`.
- **PR title:** matches the commit convention (e.g., `feature(process): encode Git Flow branch discipline`).
- **PR body** includes:
  - `Fixes #<N>` (or `Closes #<N>`, or `Related: #<N>` if it's partial progress)
  - A summary of what changed and why
  - Test plan / verification notes
- **Review** is required before merge for any work that touches:
  - Rules files (`AGENTS.md`, `CLAUDE.md`)
  - The spec (`SPEC.md`)
  - `bfw-process` itself
  - Anything flagged `ship-blocker` in the issue
- **Team work:** reviewer must be someone other than the author. Explicit GitHub approval required before merge.
- **Solo work:** no approval comment required. The branch-first + open-PR ceremony already provides the deliberate pause between authoring and merging. Re-read the diff one last time before clicking merge, then ship.

#### 9.5.6 The branch-first ceremony

Before starting work on any issue, in any BFW repo:

```bash
git switch develop
git pull
gh issue develop <N> --checkout   # OR manually:
git switch -c feature/<N>-short-slug develop
```

Then do the work. Commit as you go with the conventions above. Push the branch. Open the PR against `develop`. Review. Merge.

**Design branches use the same ceremony with one difference.** Open a `design-exploration` issue first (template in `.github/ISSUE_TEMPLATE/`), then `gh issue develop <N> --checkout --name design/<N>-<slug>` (or the manual `git switch -c` equivalent). Push as you sketch. **Don't open a PR.** The end state is `bfw-process design promote`, not a merge to develop. See §5.3.

**No exceptions for "small" changes.** The five-second branch creation has saved more work than any other single discipline in BFW's history. A "one-line fix" committed directly to `develop` or `main` is a one-line fix that bypassed CI, bypassed review, and has no rollback path short of another commit. Branch it.

#### 9.5.7 Push at milestones, branch for surgery

**Push early and often.** Local commits that never reach the remote are invisible to the team, to CI, and to future agents. Push the branch after every meaningful milestone — a phase gate, a batch of issue fixes, a passing test suite, a completed audit. If you wouldn't want to redo the work, push it.

**Create a new branch for major surgical work.** When a body of work is stable and the next step is a large rewrite, migration, or architectural change — cut a new branch from the current one before starting. This isolates the surgery from the stable foundation so that:

- The stable work can be reviewed, merged, or shipped independently.
- The surgical branch has a clean diff against a known-good base.
- If the surgery goes sideways, the stable branch is untouched.
- Parallel work can continue on the stable branch without conflict.

**When to cut a new branch:**

- Transitioning between process phases (e.g., Phase A remediation is done, Phase B is a Nuxt migration).
- Starting a rewrite of a major component or subsystem.
- Beginning work that will touch >50% of the codebase.
- Any change where "revert to before we started this" is a scenario you want to keep cheap.

The pattern: finish the current work, push, then `git switch -c feature/<N>-next-phase` from the current branch tip. The parent branch becomes the rollback point.

### 9.6 Commit and PR cheat sheet

Distilling §9.5 into a reference card:

- Branches: `feature/<N>-slug`, `fix/<N>-slug`, `design/<N>-slug` (no merge — promote via `bfw-process design promote`), `release/<version>`, `hotfix/<N>-slug`
- Base branch for daily work: **`develop`**, never `main`
- Commit prefix: `feature:` (NOT `feat:`), `fix:`, `chore:`, `docs:`, `refactor:`, `test:`, `perf:`
- Commit body references issues: `(#42)` inline, `Closes #42` on its own line for the final commit
- PR body: `Fixes #42` auto-closes the issue on merge
- PRs go to `develop` first, then `develop` → `main` is a separate merge (apps) or `develop` → `release/*` → `main` with tag (libraries)
- Never force-push `main` or `develop`
- Delete feature/fix/release branches after merge

### 9.7 What NOT to do

- Do not work on `main` or `develop` directly. Cut a branch first. Every time.
- Do not write inline "punch list" sections in `SPEC.md` as a permanent artifact. Audit scratchpads are fine during Phase 2, but they must be drained into issues before Phase 3 begins.
- Do not bury TODOs in code as the only record of a known issue. Either file it as an issue immediately or don't mention it.
- Do not close issues without a referencing PR merge (or an explicit "won't fix" + amendment).
- Do not bypass the ship gate because an open issue "isn't a real blocker" — if it's `ship-blocker` labeled, it's a blocker. Re-label it if the assessment was wrong, but do it consciously and in writing.
- Do not use `feat:` as a commit prefix. Use `feature:` spelled out.
- Do not open PRs against `main` for feature or fix work. Against `develop` always.
- Do not force-push or rewrite history on `main` or `develop`. Feature/fix branches can be rewritten pre-merge if needed.
- Do not skip the PR ceremony for "small" changes, even solo. The PR provides a deliberate pause between work and merge — that pause is the discipline.
- Do not write Eddie markup, use an Eddie token, or hand-roll an Eddie-adjacent pattern without first querying `eddie-brain` (§2.5). Memory is not a source of truth for the Eddie catalog.
- Do not file a consumer-side issue for a problem that has an upstream cause in Eddie (or any other BFW shared package) without ALSO filing the upstream issue with cross-references. Dual-filing is non-optional when the root cause is upstream (§9.4.1).
- Do not treat an eddie-brain "not found" / "empty result" as a dead end. It's always a finding to file upstream.

---

## 10. When in doubt

- **Unclear spec?** Stop and ask.
- **Considering a non-default dependency?** Stop, flag it, and ask.
- **Tempted to write a one-off component?** Don't. It's a recipe.
- **Unsure which recipe libraries to include?** Check §2.1.1. Start with core recipes, add category libraries only when the spec demands them, and default to project-local for anything speculative.
- **Need a capability Eddie doesn't cover?** Check §2.1a. Evaluate candidates against the criteria table, document the decision, and surface any Eddie gaps the integration reveals.
- **Tempted to hardcode a color because the token is "slightly off"?** Don't. It's a token gap — file an issue.
- **Tempted to skip a test "just this once"?** Don't. It's a task, not a bonus.
- **Component file getting long?** Check §2.6. Over 500 lines → review. Over 1,000 → stop and plan decomposition before adding more.
- **About to start a big rewrite?** Push your current branch first, then cut a new one. See §9.5.7.
- **Migrating an existing codebase?** Read the old code for intent, build fresh with current best practices. Don't port bugs. See §2.7.
- **Eddie packages outdated?** Check with `npm outdated`. Update before building on stale foundations. See §2.8.
- **Finished shipping?** Run the process retrospective. What did bfw-process get right, what was missing, what should change? File upstream issues. See Phase 6 step 8.
- **Tempted to bypass the ship gate?** You can't. Only an owner can, and only with the environment flag.
- **Spec underspecifies something mid-build?** File an issue using `spec-amendment.md`, add to `SPEC.md` amendments, proceed. Never silently build around it.
- **Found a bug / violation you don't have time to fix?** File the issue. Don't carry it in your head. The process is designed so that filing is free; fixing happens on someone else's clock if it has to.

---

## 11. Common failure modes

| Failure | Why it happens | Prevention |
|---|---|---|
| Building before speccing | Feels faster, is slower | `SPEC.md` is gated — no Phase 3+ without approval |
| Custom UI components instead of Eddie | Unfamiliarity with Eddie | Always check Eddie docs first; escalate to a recipe |
| Hardcoded design values | Habit | Only `--ed-*` tokens, zero exceptions |
| Skipping tests | Time pressure | Tests are part of the task, not a bonus |
| Nuxt when Eleventy was right | "Future-proofing" | Check escalation signals strictly |
| Scope creep mid-build | Spec gaps | Surface gaps as issues or amendments |
| No docs after shipping | "Will do it later" | Docs are Phase 6, not optional |
| Agent unilaterally bypassing ship gate | Over-eagerness | Owners only, human-initiated only |
| Inline punch lists in `SPEC.md` instead of issues | "I'll file them later" | Every finding becomes an issue before Phase 3 begins |
| TODO comments as the only record of known issues | Speed / laziness | File an issue; a TODO in code is not tracking |
| Writing Eddie markup from memory | Confidence / muscle memory | Query `eddie-brain` before every new component use (§2.5) |
| Fixing a consumer symptom without filing the upstream Eddie cause | "That's the Eddie team's problem" | Dual-file. Consumer and upstream get issues linked in both directions (§9.4.1) |
| Including every recipe library in every project | "Might need it later" | Only include category recipe libraries the spec actually requires (§2.1.1). Start project-local; promote when reuse is proven |
| Keeping a recipe project-local when ≥2 projects need it | Copy-paste feels faster | Upstream to `eddie-recipes` when the second project appears. Duplication across projects is a maintenance tax (§2.1.2) |
| Adopting a React-only (or Vue-only, etc.) library | "We can make it work" | Eddie is Web Components. The library must be vanilla JS, WC-native, or wrappable. Framework-coupled libraries are disqualifying (§2.1a) |
| Adopting a library without evaluating it against the criteria | Time pressure / familiarity | Run it through the §2.1a criteria table. A popular library that fails on a11y or theming creates more work than it saves |
| Not surfacing Eddie gaps found during library integration | "That's a library problem, not Eddie's" | Every missing token, recipe, or component variant the integration reveals is an Eddie gap. Dual-file it (§9.4.1) |
| Letting a component grow past 1,000 lines | One feature at a time, nobody notices | §2.6 thresholds: 500 = review, 1,000 = stop and decompose before adding more |
| Releasing a library without publishing to npm | "We tagged it, we're done" | Phase 6 publish checklist: tag + publish + verify on registry. A release that's only in git is not shipped |
| Accumulating local commits without pushing | "I'll push when it's done" | Push at every milestone. Unpushed work is invisible and unrecoverable if the machine dies (§9.5.7) |
| Starting a major rewrite on the same branch as stable work | "It's all one feature" | Cut a new branch before surgery. The stable branch is your rollback point (§9.5.7) |
| Faithfully porting bugs during a migration | "That's how the old code worked" | Read for intent, rebuild fresh. A migration that reproduces bugs defeats its purpose (§2.7) |
| Building on stale Eddie dependencies | "It works, why update?" | Stale deps mean building on top of already-fixed problems. Check `npm outdated` first (§2.8) |
| Shipping without a process retrospective | "We're done, move on" | The retrospective is how bfw-process improves. Every project that ships teaches the process something (Phase 6 step 8) |
| Using Western-centric example data or assuming user identity | Default habits / training data bias | Run the Charter §3 self-review checklist. Diverse names, culturally neutral contexts, no assumptions about abilities, gender, race, religion, class, or circumstances (§0, principle 9) |
| Merging a design branch into `develop` | Muscle memory / treating it like a feature branch | Design branches never merge. Promotion via `bfw-process design promote` produces fresh `feature/*` branches off `develop`; the design branch becomes an archive tag (§5.3) |
| Letting design-branch prototypes ship without promotion | "It's basically done already" | Promotion is the cleanup boundary — the place where deviations become issues, the spec gets drafted, and a11y/Eddie/test discipline gets reapplied. Bypassing promotion bypasses the entire point of the split (§5.3) |
| Treating "let 'er rip" as an Eddie-discipline bypass on a design branch | Phrase overload | "Let 'er rip" can mean "go faster" / "stop asking questions" — it is NOT a license to bypass Eddie. Only treat phrases that explicitly signal *bypassing Eddie or tokens* as exploration triggers ("color outside the lines", "dream up a new theme", "sketch this fresh", "don't use Eddie"). When in doubt, ask (§5.3) |
| Relaxing the a11y baseline on a design branch | "It's just a sketch" | a11y is never relaxable on any branch in any mode. Semantic HTML, keyboard reach, contrast — always on. Retrofitting a11y is an order of magnitude more expensive than getting it right the first time (§2.3, §5.3) |
| Promotion auto-files the entire deviation cohort without human review | Optimizing for fewer keystrokes | The promotion command must show the human a summary and wait for confirmation before filing. Auto-filing turns the tracker into noise; human-in-the-loop keeps it signal (§5.3) |
| Promotion produces only a local report file, not real GitHub Issues | "I'll file them later" | §9 is clear: GitHub Issues are BFW's canonical paper trail. The promotion command files actual issues with cross-references and labels — a markdown file in the repo is not tracking (§5.3, §9) |

---

## 12. References

- `SPEC.md` — the spec for *this* specific project (read it after this file)
- `.bfw-process/config.json` — mode, owners, project type for this project
- `.bfw-process/foundations/design-system-community-charter.md` — snapshot of the Design System Community Charter (canonical: [gist](https://gist.github.com/hereinthehive/bf4053e3721e3395a1b30e30b98a196c))
- `.bfw-process/phases/` — expanded guidance for each of the six phases
- `.bfw-process/checklists/` — the checklists used by `verify-phase`
- Eddie Design System: https://ds.bradfrost.com
- Eddie monorepo: https://github.com/Brad-Frost-Web/eddie-design-system
- Process canonical repo: https://github.com/Brad-Frost-Web/bfw-process

---

*This file is generated and maintained by `@brad-frost-web/bfw-process`. To update the rules in your project, run `bfw-process sync`. To update the rules for all BFW projects, contribute to the canonical repo and cut a new version.*
