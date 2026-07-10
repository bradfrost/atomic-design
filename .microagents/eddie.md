---
name: eddie-design-system
type: knowledge
agent: CodeActAgent
triggers:
  - eddie
  - design system
  - component
  - recipe
  - eddie-web-components
  - eddie-recipes
  - eddie-pages
  - eddie-brain
  - eddie-icons
  - design token
  - --ed-
  - mcp__eddie-brain
---

# Eddie Design System

Eddie is the Brad Frost Web design system. It is the **only** UI layer for BFW projects. There are no exceptions.

## `eddie-brain` is the source of truth — query it before writing anything

The **`eddie-brain` MCP server** is the authoritative catalog for Eddie. It exposes 8 tools via MCP. **Use them. Do not write Eddie markup from memory.**

- **`eddie_check_health`** — start of every session. Component/token/recipe/page totals + learning-loop stats.
- **`eddie_search(query)`** — natural-language find for components, tokens, recipes.
- **`eddie_get_component(name)`** — full metadata for a specific component. **Call before writing `<ed-*>` markup.**
- **`eddie_get_token(name)`** — full metadata for a token. **Call before using `var(--ed-*)`.**
- **`eddie_get_relationships(component)`** — recipes that involve a given component.
- **`eddie_compose_recipe(intent)`** — "I need to build X" → suggested composition. Use for dashboards, forms, error states, any whole-UI pattern.
- **`eddie_validate_file(path)`** — run before every commit touching Eddie code. Part of Phase 5 ship gate.
- **`eddie_suggest_fix(issue, file, line)`** — guided remediation after validation fails.

**Every "not found" / "empty result" is a finding.** File it against `Brad-Frost-Web/eddie-design-system` with the `process-finding.md` template, using the dual-filing pattern in `AGENTS.md` §9.4.1 (consumer-side + upstream with cross-references).

If eddie-brain is not connected in your MCP session: **stop and tell the human.** Do not guess at the catalog. Eddie work without eddie-brain is guessing.

## Packages

- `@brad-frost-web/eddie-web-components` — core Lit-based web components (buttons, inputs, cards, modals, etc.)
- `@brad-frost-web/eddie-recipes` — product-specific compositions built from core components
- `@brad-frost-web/eddie-design-tokens` — CSS custom properties (`--ed-*`), JS, JSON
- `@brad-frost-web/eddie-icons` — SVG icon sprite

## Docs

https://ds.bradfrost.com

## Monorepo

https://github.com/Brad-Frost-Web/eddie-design-system

## The workflow when Eddie doesn't cover a UI need

1. **Check `eddie-web-components`.** Is there a variant, slot, or configuration that covers the case? Read the component docs before declaring a gap.
2. **Check `eddie-recipes`.** Someone else may have already built this composition for another project.
3. **If neither exists, create a new recipe in `eddie-recipes`.** Not in the consumer project. Not as inline HTML+CSS. A recipe.
4. **If the recipe should eventually graduate to core components**, file an issue in the Eddie monorepo describing why.

## What "creating a recipe" looks like

- Work in the `eddie-recipes` package of the Eddie monorepo (separate from the consumer project)
- Follow the recipe template in that package
- Add a Storybook story
- PR the recipe
- Consume the recipe in your project via the package, not via copy-paste

## Hard prohibitions

- **No** `<div class="custom-card">` with hand-rolled styles in a consumer project
- **No** Tailwind, Bootstrap, Material UI, Chakra, shadcn, or any other CSS framework
- **No** hardcoded color, spacing, or type values — use `--ed-*` tokens
- **No** Google Fonts `<link>` tags — fonts come from Eddie's `fonts.scss`
- **No** inline SVG icons from random sources — use `@brad-frost-web/eddie-icons`

## When you're tempted to break these rules

You're not. Create a recipe. File an issue. Use a token. The shortcut is the slower path.
