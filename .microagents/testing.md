---
name: testing
type: knowledge
agent: CodeActAgent
triggers:
  - test
  - tests
  - unit test
  - integration test
  - vitest
  - jest
  - playwright
  - coverage
---

# Testing at BFW

Tests are **part of the task definition**, not a bonus. You write them alongside the code, not after.

## The rule

If you're closing a Phase 4 task without a test, you're closing it wrong. This applies to every task that has logic, behavior, or user-facing state. Boilerplate-only tasks (scaffolding, pure config) are exempt.

## Default test stack

- **Unit tests:** Vitest (Eleventy projects, Nuxt projects, any ESM Node codebase). Jest if a project already uses it, but prefer Vitest for new work.
- **Component tests:** `@web/test-runner` for web-component tests (Eddie land). Vitest for Vue component tests (Nuxt land).
- **Integration / E2E:** Playwright. Use it for user-flow verification against a running dev server.
- **a11y automation:** `axe-core` integrated into Playwright or as a standalone Lighthouse run in CI.

## What to test

- **Logic:** pure functions, data transforms, state machines. Full coverage of edge cases.
- **Behavior:** user interactions on components. Click, type, submit — does the right thing happen?
- **Spec flows:** each user flow in `SPEC.md` has at least one Playwright test walking through it.
- **a11y:** axe assertions on key pages and components.
- **Regressions:** every bug fix includes a test that would have caught the bug.

## What NOT to test

- Don't test the framework. Don't test that Vue renders a prop. Don't test that Eleventy writes HTML. Test your code.
- Don't test CSS visual output with unit tests. Use Playwright or a screenshot tool for visual regressions if you need them.
- Don't aim for 100% coverage for its own sake. Aim for full coverage of risk-bearing code.

## Phase 5 ties this together

`npm run bfw:ship` (which runs `bfw-process verify-phase ship` via the pinned devDependency) runs `npm run bfw:verify:tests` which should execute your full test suite. If it exits non-zero, you don't ship. See `checklists/phase-5-ship-readiness.md` for the full list of required `bfw:verify:*` scripts.

## Quick mode note

In Quick mode, tests are **optional but encouraged** for anything that might get promoted to Full later. Every test you write in Quick mode is one less test to write during "do it for real now" promotion.
