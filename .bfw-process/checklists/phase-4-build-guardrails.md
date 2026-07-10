# Phase 4 Build Guardrails

Live checks while coding. If any of these is violated, stop and fix before continuing.

## Eddie-first

- [ ] Every UI element is an Eddie Web Component or Eddie Recipe
- [ ] No `<div class="my-custom-card">` with hand-rolled styles
- [ ] No Tailwind / Bootstrap / Material UI / Chakra / shadcn / etc.
- [ ] No one-off component code in the consumer project
- [ ] If a new pattern was needed, a recipe exists (or is PR'd) in `eddie-recipes`

## Tokens only

- [ ] No hardcoded color values (hex, rgb, hsl, named)
- [ ] No hardcoded spacing values (px, rem, em outside of token aliases)
- [ ] No hardcoded type values (font-size, line-height, weight)
- [ ] No hardcoded radii, shadows, or z-indices
- [ ] No Google Fonts `<link>` tags
- [ ] Every design value references a `--ed-*` token

## Accessibility

- [ ] Semantic HTML throughout (`<button>`, `<a>`, `<nav>`, `<main>`, heading order)
- [ ] Every interactive element is keyboard-reachable and operable
- [ ] Color contrast ≥ WCAG AA
- [ ] Every image has alt text (or `alt=""` if decorative)
- [ ] ARIA used only where HTML semantics don't cover it
- [ ] Forms: labels, error messages, focus management
- [ ] Core functionality works without JS

## Tests

- [ ] Unit tests written alongside each task, not after
- [ ] Tests pass locally before each commit
- [ ] Test coverage is proportional to risk (critical paths covered; boilerplate skipped)

## Commits

- [ ] Small, scoped commits
- [ ] Clear commit messages describing what and why
- [ ] No "WIP" commits in the main branch's history at merge time

## Component complexity (§2.6)

- [ ] No single component file exceeds 1,000 lines without a filed decomposition issue
- [ ] No component handles more than 3 distinct responsibilities without review
- [ ] Can describe each component's purpose in one sentence without "and"

## Migration discipline (§2.7, when applicable)

- [ ] If migrating: are you rebuilding intent, or copying implementation?
- [ ] If the old code had a known bug in this area, is the new code fixed?
- [ ] If a feature was half-implemented, is it either complete or cut?
- [ ] Are you using the new framework's idioms, not fighting them?

## Dependency freshness (§2.8)

- [ ] All `@brad-frost-web/*` packages are on latest stable
- [ ] No pre-release versions in production dependencies (unless documented)
- [ ] Verified latest versions are published on npm, not just tagged in git

## Spec fidelity

- [ ] If implementation revealed a spec gap, it's been recorded as an amendment or issue
- [ ] No silent decisions around spec gaps
