# Eddie Brain Usage Checklist

Quick-reference for the 8 `eddie-brain` MCP tools and when to use each. Full rules in `AGENTS.md` §2.5.

## Every session that touches Eddie

- [ ] `eddie_check_health` — first call. Log the numbers. If recipes < 10 or pages < 3, the canonical composition corpus is thin and you should expect to compose from primitives (and file issues).

## Before writing any `<ed-*>` markup

- [ ] `eddie_get_component("<ed-name>")` — check props, slots, events, guidelines
- [ ] If the component isn't found: file a `Brad-Frost-Web/eddie-design-system` issue with `eddie-brain` + `bfw/docs` labels, note the gap in the consumer issue body

## Before using any `var(--ed-*)` token

- [ ] `eddie_get_token("<--ed-name>")` — verify the token exists and get its value/tier/intent
- [ ] If the token isn't found and `suggestions` is empty: file an upstream issue with `eddie-brain` + `bfw/tokens` labels
- [ ] Never hardcode a fallback value. `var(--ed-foo, #hex)` is a sign that the token verification was skipped.

## Before hand-rolling a UI pattern

- [ ] `eddie_search("<pattern description>")` — find any existing components or recipes
- [ ] `eddie_compose_recipe("<intent>")` — check for a canonical composition for this UI type
- [ ] If both return nothing or irrelevant matches: file upstream issue(s) — one for the missing recipe, separately one for the bad ranker if the matches are clearly irrelevant (§9.4.1 dual-filing)
- [ ] Proceed with the best available workaround. Document it in the consumer issue so the upstream fix lands in the consumer when it ships.

## Phase 3 component inventory

- [ ] For every UI element in `SPEC.md`, run `eddie_search` and `eddie_compose_recipe`
- [ ] For every composing component, run `eddie_get_component`
- [ ] For every design value (color, spacing, typography), run `eddie_get_token`
- [ ] File upstream issues for every gap before Phase 4 begins

## Phase 4 build

- [ ] Run `eddie_validate_file <path>` before every commit that touches Eddie code (`.ts`, `.scss`, `.vue`, `.njk`)
- [ ] If validation flags issues: run `eddie_suggest_fix` for each, evaluate the suggestion, apply or modify
- [ ] Reject bad suggestions explicitly — this feeds the learning loop's `mostRejectedType`

## Phase 5 ship gate

- [ ] `eddie_validate_file` on every Eddie-touching file in the branch → zero violations before merge to `develop` → `main`

## When eddie-brain is down

- [ ] **Stop work.** Tell the human. Do not proceed without the catalog.
- [ ] Eddie work based on memory is guessing; guessing is what produces technically-compliant but poorly-composed BFW sites.

## Dual-filing reminder

Every eddie-brain finding has two sides:

1. **Consumer-side issue** — names the file/line where the symptom appears, blocked on the upstream fix, documented workaround if any
2. **Upstream issue** — names the gap in eddie-brain / eddie-recipes / eddie-pages / eddie-web-components / eddie-design-tokens, attributes to the consumer audit that surfaced it

Link both ways in the issue bodies. See `AGENTS.md` §9.4.1 for the dual-filing protocol.
