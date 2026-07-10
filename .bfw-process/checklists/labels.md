# BFW Standard Labels

These are the canonical labels used across all BFW projects to make issues filterable, assignable, and agent-workable. Apply them in every BFW repo on day one. When running `bfw-process init` against a repo with GitHub remotes, these labels can be created with:

```bash
# Create BFW labels in the current repo (run once per repo)
gh label create "bfw/eddie"      --color "4a90e2" --description "Eddie Design System compliance"
gh label create "bfw/tokens"     --color "4a90e2" --description "Hardcoded values / missing --ed-* tokens"
gh label create "bfw/a11y"       --color "7b42f6" --description "Accessibility / WCAG compliance"
gh label create "bfw/testing"    --color "f5a623" --description "Test coverage / test infrastructure"
gh label create "bfw/infra"      --color "8b572a" --description "Build, deploy, CI, tooling"
gh label create "bfw/docs"       --color "417505" --description "Documentation gaps or drift"
gh label create "bfw/process"    --color "9013fe" --description "BFW process / workflow / gating"
gh label create "bfw/security"   --color "d0021b" --description "Security posture / secret handling"

gh label create "ship-blocker"   --color "b60205" --description "Phase 5 ship gate fails while this is open"
gh label create "pre-launch"     --color "e99695" --description "Fix before first external launch"
gh label create "nice-to-have"   --color "c2e0c6" --description "Fix when capacity allows"
gh label create "someday-maybe"  --color "cccccc" --description "Known debt, not currently planned"
```

## Category labels

All BFW-rule issues get at least one of these. Multiple categories are fine.

| Label | When to use |
|---|---|
| `bfw/eddie` | Eddie Design System compliance: custom components in consumer projects, non-Eddie CSS frameworks, missing recipes. |
| `bfw/tokens` | Hardcoded design values (hex, px, rem, named colors), missing `--ed-*` tokens, Google Fonts links. |
| `bfw/a11y` | WCAG 2.1 AA (or stricter per-project target) violations: color contrast, keyboard, semantics, ARIA misuse, missing alt. |
| `bfw/testing` | Missing unit tests, missing integration tests, uncovered critical paths, test infrastructure gaps. |
| `bfw/infra` | Build, deploy, CI, tooling, `bfw:verify:*` script wiring. |
| `bfw/docs` | README gaps, `SPEC.md` drift, `CLAUDE.md` staleness, missing inline docs where non-obvious. |
| `bfw/process` | BFW process / workflow / gating: phase gate behavior, spec approval flow, owner bypass. |
| `bfw/security` | Client-exposed tokens, missing input validation, unsafe error responses, `.env` in git. |

## Severity labels

Every issue gets exactly one severity label. The severity drives scheduling.

| Label | Meaning | Gate behavior |
|---|---|---|
| `ship-blocker` | Phase 5 ship-readiness gate **will fail** while this issue is open. Must be fixed or explicitly waived by an owner before shipping. | `bfw-process verify-phase ship` can optionally query for open `ship-blocker` issues and fail if any exist. |
| `pre-launch` | Should be fixed before first external launch, but not blocking day-to-day Phase 4 work. | No gate; tracked for launch readiness. |
| `nice-to-have` | Worth doing when there's capacity. Not time-sensitive. | No gate. |
| `someday-maybe` | Known debt, tracked for completeness but not planned. | No gate. |

## Extra labels (optional per-project)

Projects may add:

- `good-first-issue` — Agent- or junior-friendly; clear scope, low prerequisites.
- `help-wanted` — Owner would welcome a PR from anyone.
- `blocked` — Waiting on something else (upstream issue, external decision, etc.). Add a comment explaining what.
- `in-progress` — Actively being worked by someone (usually auto-set by `gh issue develop`).

## The agent-workable contract

An agent running in a BFW project should be able to:

```bash
# Find work
gh issue list --label "bfw/eddie,ship-blocker" --state open --json number,title,body,labels

# Claim it
gh issue develop <N> --checkout

# Do the work, commit with references
git commit -m "fix: extract stat-card recipe (#<N>)"

# Open a PR
gh pr create --title "fix: extract stat-card recipe" --body "Fixes #<N>"
```

This is the whole point of the cycle: humans and agents both work from the same queue, same conventions, same paper trail.
