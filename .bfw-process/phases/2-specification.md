# Phase 2 — Specification

> **Goal:** Produce a written, reviewed, approved `SPEC.md` that will serve as the contract for Phase 3–6. No implementation happens until this exists and is approved.

## Inputs

- Phase 1 outputs (project type, mode, clarifying decisions)
- The project brief
- `.bfw-process/templates/SPEC.md` (the template)

## Activities

1. **Copy the template** from `.bfw-process/templates/SPEC.md` to the project root as `SPEC.md` if it doesn't already exist.
2. **Fill in every section.** Do not leave sections empty or `TODO`. If a section doesn't apply, write "N/A" with a one-line explanation.
3. **Use plain English.** No wireframes, no ASCII mockups, no pseudo-code. Describe user flows and outcomes in sentences a non-engineer can follow.
4. **Lead with outcomes, not features.** "Users can find their receipts in under two clicks" beats "implement receipt search view with filters."
5. **List non-goals explicitly.** What we are NOT building is often more important than what we are.
6. **Surface open questions.** Every unknown gets listed in §Open Questions. Don't decide around them silently.
7. **Set `status: draft`** in the frontmatter. Commit.
8. **Stop.** Ask for review.

## Checklist

See `checklists/phase-2-spec-review.md`.

## The gate

`SPEC.md` must have `status: approved` in its frontmatter before Phase 3 begins. If it says `draft`, you wait. If it's missing, you go back to step 1.

An **agent must not** self-approve a spec. Only a human promotes `draft` → `approved`.

## Amendments

If the spec changes after Phase 4 has begun, record the change in the `amendments` array in the frontmatter:

```yaml
amendments:
  - date: 2026-04-15
    author: Brad Frost
    summary: Added dark mode as a non-goal; was ambiguous in original spec.
```

Never silently build around a spec gap. Either amend or surface an issue.

## Quick mode note

In Quick mode, Phase 2 is **skipped**. No `SPEC.md` required. If later someone says "do it for real now," see the Promotion section of `AGENTS.md` §5.4 — a draft spec will be generated from the existing code at that point.

## Design-branch note

On a `design/*` branch, Phase 2 is also **skipped** — but for a different reason. Design branches are *exploratory by design*; a spec would freeze the exploration before it's ready. The spec is generated *at promotion time* by `bfw-process design promote`, which also files the cohort of follow-up issues that the exploration surfaced. See AGENTS.md §5.3. Until promotion, do not write `SPEC.md` on a design branch.

## Output

`SPEC.md` in the project root with `status: approved` (or `status: draft` and a clear signal that a human has been asked to review it).
