# Phase 5 — Test & Verify (the HARD gate)

> **Goal:** Prove the build is ready to ship. This is the one phase with enforced gates.

## Inputs

- Working code from Phase 4
- `SPEC.md` (approved) — used to verify each user flow
- The `verify-phase ship` script

## Activities

1. **Run unit tests.** All green. `npm test` or equivalent.
2. **Run `eddie_validate_file` on every changed Eddie-touching file** in the PR. Zero violations is the target. Any remaining violation either gets fixed or is documented as an accepted deviation in `SPEC.md` with an issue link explaining why. `eddie-brain` is part of the ship gate, not just Phase 4.
3. **Run the automated a11y audit.** axe, Lighthouse accessibility, or equivalent. Zero violations is the target; every flagged issue gets resolved or explicitly waived with rationale.
3. **Cross-browser spot-check.** Chrome and Firefox at minimum. Safari if time allows. Report any discrepancies.
4. **Mobile / responsive check.** Verify the build works across representative breakpoints. BFW is a web-standards environment, not desktop-only.
5. **Verify each user flow from `SPEC.md` manually.** Walk through each flow described in the spec and confirm it works as described.
6. **Performance spot-check.** Lighthouse score. No obvious regressions from prior ship. If this is a first ship, establish the baseline.
7. **Edge cases.** Empty states, error states, loading states, no-JS fallback. All handled.

## The hard gate

Run:

```bash
npm run bfw:ship
```

This script (added by `bfw-process init`) runs `bfw-process verify-phase ship` via the version of `@brad-frost-web/bfw-process` pinned in `devDependencies`, so CI, collaborators, and local runs all resolve to the same pinned version. It executes the checklist in `checklists/phase-5-ship-readiness.md` programmatically (by calling `npm run bfw:verify:*` scripts defined in the consumer's `package.json`). On any failure, it exits non-zero. **No shipping until this passes.**

## Owner bypass

A co-owner (someone in `owners[]` in `.bfw-process/config.json`) can bypass the gate in emergencies:

```bash
BFW_OWNER_OVERRIDE=1 npm run bfw:ship
```

This requires:

1. `BFW_OWNER_OVERRIDE=1` in the environment
2. The current git `user.email` matches an entry in `owners[].email`

The bypass is logged to `.bfw-process/overrides.log` with timestamp, user, and which checks were skipped.

**Agents must not run `BFW_OWNER_OVERRIDE=1` unilaterally.** Only run it if an owner has explicitly instructed you to. This is non-delegable authority.

Non-owners have no bypass. They fix the failing checks.

## Checklist

See `checklists/phase-5-ship-readiness.md`.

## Output

- Test summary (pass/fail for each check)
- `verify-phase ship` exit 0, or a logged owner bypass

## Quick mode note

In Quick mode, Phase 5 is **skipped**. If the project is promoted to Full mode later, Phase 5 runs in full force.
