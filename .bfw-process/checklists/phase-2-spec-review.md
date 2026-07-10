# Phase 2 Spec Review Checklist

Use this when reviewing a `SPEC.md` before promoting it to `status: approved`.

## Frontmatter

- [ ] `status` is `draft`
- [ ] `owners` list is correct
- [ ] `last_updated` is today's date

## Required sections (all must be present and filled in)

- [ ] **What it is** — one paragraph, plain English
- [ ] **Who it's for** — target users, use context
- [ ] **Goals** — outcomes, not feature lists
- [ ] **Non-goals** — explicit scope boundaries
- [ ] **User flows** — key journeys in plain English
- [ ] **Data model** — key entities and relationships (or "N/A" with explanation)
- [ ] **Tech decisions** — stack choices and rationale for any non-defaults
- [ ] **Accessibility requirements** — any specific WCAG targets beyond baseline
- [ ] **Open questions** — unknowns needing human input

## Quality checks

- [ ] Goals are outcomes, not feature lists
- [ ] Non-goals are explicit and specific (not just "we won't build unrelated things")
- [ ] User flows read like sentences a non-engineer can follow
- [ ] Every non-default tech decision has a written rationale
- [ ] Every open question is actually answerable (not rhetorical)
- [ ] No section says `TODO` or is empty
- [ ] No hidden assumptions (e.g., "we'll figure out auth later" is either scoped in or listed as non-goal)

## Promotion

When every item above is checked:

1. Frontmatter `status: draft` → `status: approved`
2. Commit the spec
3. Phase 3 can begin
