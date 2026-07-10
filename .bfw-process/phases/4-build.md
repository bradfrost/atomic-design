# Phase 4 — Build

> **Goal:** Execute against the spec and task list, writing code that passes Phase 5 on the first try.

## Inputs

- `SPEC.md` (approved)
- Phase 3 task list, component inventory, test strategy
- Access to the default stack

## Activities

1. **Work through tasks in dependency order.** Foundation first, features second, polish third.
2. **Follow the always-on rules from `AGENTS.md` §2.** Eddie-first. Tokens only. a11y baseline. Progressive enhancement. **`eddie-brain` before writing any Eddie markup** — query `eddie_get_component` and `eddie_get_token` before using anything you haven't used in the last hour. Never write `<ed-foo>` or `var(--ed-bar)` from memory.
3. **Validate Eddie files with `eddie_validate_file` before every commit** that touches `.ts`, `.scss`, `.vue`, or `.njk` files consuming Eddie. Fix violations or call `eddie_suggest_fix` for guided remediation. Do not commit files that fail validation.
4. **Write tests alongside each task.** Not after. Unit tests are part of the task definition, not a bonus.
5. **Commit frequently.** Small, scoped commits. Clear messages describing what and why. The commit log should read like a narrative of how the project came together.
6. **Surface amendments.** If implementation reveals the spec underspecified something, stop and amend `SPEC.md` (or file a GitHub issue). Do not silently decide around spec gaps.
7. **Escalate to recipes when UI doesn't fit Eddie.** See `AGENTS.md` §2.1. Never write one-off UI code. When `eddie-brain` reveals a gap (missing component, missing recipe, missing token), file a dual-filed issue pair per §9.4.1 and proceed with the best available workaround — documented, not buried.
8. **Execute third-party library proof-of-concepts early.** If Phase 3 identified third-party libraries that need a spike (see `AGENTS.md` §2.1a), build the proof-of-concept before wiring the library into the full feature build. Confirm Eddie token theming works, a11y output is acceptable, and SSR doesn't break. If the spike fails the criteria, go back to the candidate list — don't force-fit a library that doesn't integrate cleanly.

## Guardrails (repeat from `AGENTS.md` because these are the failure points)

- No custom presentational CSS. No Tailwind. No Bootstrap. No Material UI. No Chakra. No shadcn.
- No hardcoded color, spacing, or type values. Only `--ed-*` tokens.
- No Google Fonts `<link>` tags. Fonts come from Eddie.
- Accessibility at every step, not as a cleanup pass.
- Progressive enhancement. Core functionality works without JS.

## Checklist

See `checklists/phase-4-build-guardrails.md`.

## When migrating frameworks

If Phase 3 identified a framework migration (e.g., vanilla Lit → Nuxt, Eleventy → Nuxt), follow this approach:

1. **Don't do a big-bang rewrite.** Migrate incrementally — install the new framework alongside the existing code, then move features one at a time.
2. **Start with the simplest page or mode.** Get one route working end-to-end before tackling complexity.
3. **Let the new framework's idioms guide decomposition.** A monolithic component that handles routing, state, and rendering doesn't need to be decomposed in the old framework first — the new framework's pages, composables, and server routes *are* the decomposition.
4. **Presentational components (Lit Web Components) stay as-is.** Consume them from the new framework. Don't rewrite `<ed-slide>` in Vue — Vue's `isCustomElement` config handles this.
5. **Data utilities (parsers, serializers) copy directly.** No rewrite needed — they're framework-agnostic.
6. **App orchestration gets rebuilt using new framework idioms.** Routing, state management, API calls, persistence — these are what the migration is *for*. See §2.7.
7. **Delete old infrastructure only after all routes work and all tests pass.** The old code is your reference implementation until the new code fully replaces it.
8. **Apply §2.7 throughout.** Read old code for intent, rebuild with current best practices. Don't port bugs.

## When a required component doesn't exist in Eddie

1. Check `eddie-web-components` — is there a variant or configuration that covers it?
2. Check `eddie-recipes` — has someone already created a product-specific composition?
3. If neither: create a new recipe in `eddie-recipes`. File an issue in the Eddie monorepo if it should graduate to core.
4. **Under no circumstances** write one-off component code in the consumer project.

## Output

- Working code for every task in the Phase 3 list
- Unit tests alongside
- Commit history telling the story
- Any spec amendments recorded
- Any new recipes PR'd to `eddie-recipes`

## Quick mode note

In Quick mode, you proceed directly here after Phase 1. The always-on rules from `AGENTS.md` §2 still apply. Tests and commits can be relaxed in favor of velocity. Recipes can be postponed as long as the one-off code is obviously extractable later if promotion happens.
