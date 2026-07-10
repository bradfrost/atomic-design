# Retroactive Audit Checklist

When adopting `bfw-process` into an existing project, use this checklist to systematically audit the codebase against BFW rules. Every finding becomes a GitHub issue.

## Before you start

- [ ] Read `AGENTS.md` in full — you're auditing against these rules
- [ ] Create BFW labels in the repo (`bfw-process init` does this, or run the `gh label create` commands from `checklists/labels.md`)
- [ ] Have `eddie-brain` MCP server connected if the project touches Eddie

## Token compliance (bfw/tokens)

- [ ] Search for hardcoded hex colors (`#abc123`, `rgb(`, `rgba(`, `hsl(`)
- [ ] Search for hardcoded spacing values (raw `px`, `rem`, `em` not in token aliases)
- [ ] Search for hardcoded typography (font-size, font-weight, line-height not via tokens)
- [ ] Search for hardcoded radii, shadows, z-indices
- [ ] Search for Google Fonts `<link>` tags
- [ ] Verify all design values resolve to `--ed-*` CSS custom properties
- [ ] Check for hex fallbacks in `var()` — these are signs of missing tokens

## Eddie-first discipline (bfw/eddie)

- [ ] Search for custom presentational components that should be Eddie components or recipes
- [ ] Check CSS class naming follows BEM + BEMIT with `ed-c-` prefix
- [ ] Search for Tailwind, Bootstrap, Material UI, Chakra, shadcn, or other frameworks
- [ ] Check that icons come from `eddie-icons`, not inline SVGs
- [ ] Run `eddie_check_health` to understand the Eddie corpus before auditing

## Accessibility (bfw/a11y)

- [ ] Check for ARIA attributes (`aria-label`, `role`, `aria-live`, etc.)
- [ ] Check for keyboard event handlers on interactive elements
- [ ] Check for focus management during mode/view switches
- [ ] Check for `prefers-reduced-motion` media queries on animated elements
- [ ] Check for alt text on images (or `alt=""` for decorative)
- [ ] Check for semantic HTML (`<button>`, `<nav>`, `<main>`, heading hierarchy)
- [ ] Run `axe-core` or equivalent on key pages if a test suite exists

## Testing (bfw/testing)

- [ ] Count components with test files vs. without
- [ ] Check for integration/e2e tests
- [ ] Check for a11y-specific tests (axe-core)
- [ ] Verify test infrastructure exists (test runner, config, CI integration)

## Component complexity (bfw/process, §2.6)

- [ ] Check file line counts — flag anything over 500, issue anything over 1,000
- [ ] For flagged components: list distinct responsibilities (rendering, data, nav, state, input, animation, API)
- [ ] Apply the litmus test: can you describe each component in one sentence without "and"?

## Infrastructure (bfw/infra)

- [ ] ESLint configured?
- [ ] Prettier configured?
- [ ] Pre-commit hooks (Husky/lint-staged)?
- [ ] CI/CD workflows (GitHub Actions)?
- [ ] `bfw:verify:*` scripts in package.json?
- [ ] `develop` branch exists (bfw-process git flow)?

## Security (bfw/security)

- [ ] API keys or secrets in client-side code?
- [ ] API keys in `window.*` globals or `<meta>` tags?
- [ ] Direct external API calls from browser with exposed keys?
- [ ] Input sanitization on user-provided content?
- [ ] `.env` files excluded from git?

## Dependency freshness (bfw/eddie)

- [ ] Run `npm outdated` for `@brad-frost-web/*` packages
- [ ] Check if pinned versions are pre-release (`-pre.0`, `-beta`, `-rc`)
- [ ] Verify latest versions are actually published on npm (`npm view <pkg> version`)
- [ ] Check peer dependency compatibility across Eddie packages

## Documentation (bfw/docs)

- [ ] JSDoc on public APIs (properties, methods, events, slots)
- [ ] README reflects current project state
- [ ] SPEC.md exists (or needs to be written from the existing code)

## After the audit

- [ ] Every finding is filed as a GitHub issue (one per atomic finding)
- [ ] Every issue has category label(s) + exactly one severity label
- [ ] Upstream causes are dual-filed (consumer issue + upstream issue, cross-referenced)
- [ ] SPEC.md amendment records the audit cohort: `"Retroactive audit filed N findings as issues #X–#Y"`
- [ ] Findings are sequenced: portable fixes first (tokens, a11y, tests), architectural changes second
