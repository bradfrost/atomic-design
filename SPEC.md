---
status: draft
owners:
  - Brad Frost
  - Ian Frost
last_updated: YYYY-MM-DD
amendments: []
---

# SPEC.md — {{project_name}}

> **Phase 2 spec. Status must be `approved` before Phase 3 begins.**
>
> Instructions: fill in every section. If a section doesn't apply, write "N/A" with a one-line explanation. Do not leave sections empty or as `TODO`. When complete and reviewed, change `status: draft` → `status: approved` in the frontmatter.

## 1. What it is

_One paragraph, plain English. What is this thing? What does it do?_

## 2. Who it's for

_Target users, use context, the situations in which they'll use it._

## 3. Goals

_Outcomes, not feature lists. "Users can find their last invoice in under two clicks" beats "implement invoice search view."_

-

## 4. Non-goals

_Explicit scope boundaries. What are we NOT building? This is often more important than the goals list._

-

## 5. User flows

_Key journeys in plain English. Not wireframes, not pseudo-code. Sentences a non-engineer can follow._

### Flow A —

1.
2.
3.

### Flow B —

1.

## 6. Data model

_Key entities and relationships, if applicable. Tables, fields, joins. Or "N/A" with a one-line explanation if this project has no persistent data._

## 7. Deployment model

_Where does this run? What differs between environments? If the app reads or writes data, how does persistence work in each environment?_

| Environment | Hosting | Persistence | Notes |
|-------------|---------|-------------|-------|
| Local dev   |         |             |       |
| Production  |         |             |       |

_If the app must work offline, on multiple cloud providers, or in CI environments, note that here. If the production filesystem is read-only (e.g., Netlify, Vercel), explain how writes are handled._

## 8. Tech decisions

_Stack choices and rationale for any non-defaults. If you're just using the BFW default stack (Eleventy or Nuxt + Eddie + Netlify), say so. If you're deviating, say what and why._

- **Project type:** <!-- content-site | app | recipe | script -->
- **Framework:** <!-- Eleventy | Nuxt | none -->
- **Hosting:** <!-- Netlify | other (with rationale) -->
- **Deviations:** <!-- list any, with rationale -->

## 9. Accessibility requirements

_Any specific WCAG targets beyond the BFW baseline (WCAG 2.1 AA). Any specific user groups (screen readers, keyboard-only, low vision, etc.) that need special attention._

## 10. Open questions

_Unknowns that need human input before build starts. Every question should be actually answerable (not rhetorical). If you're an agent, put questions here instead of making decisions unilaterally._

1.

## 11. Success criteria

_How will we know this project is "done"? A bulleted list of observable, testable outcomes. These are what Phase 5 verifies against._

-

---

*This template is from `@brad-frost-web/bfw-process`. Do not remove the frontmatter.*
