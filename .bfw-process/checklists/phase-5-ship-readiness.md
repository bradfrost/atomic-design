# Phase 5 Ship-Readiness Checklist (the HARD gate)

This is the one checklist with teeth. `npm run bfw:ship` (added to every scaffolded project by `bfw-process init`, and pinned via `devDependencies`) runs these programmatically by shelling out to `npm run bfw:verify:*` scripts in the consumer's `package.json`.

## Required `npm run bfw:verify:*` scripts

Your consumer project must define these scripts in `package.json`. Missing scripts cause `verify-phase ship` to fail loudly rather than silently pass.

| Script | Purpose |
|---|---|
| `bfw:verify:tests` | Run the full unit test suite; exit non-zero on any failure |
| `bfw:verify:a11y` | Run axe / Lighthouse a11y check against built output |
| `bfw:verify:responsive` | Smoke-test representative breakpoints (or a screenshot diff) |
| `bfw:verify:flows` | Run spec user-flow verifications (e.g., Playwright or a checklist the human confirms) |
| `bfw:verify:perf` | Lighthouse performance score; fail on obvious regression from baseline |

## Manual checks (not automated, but still required)

- [ ] Each user flow from `SPEC.md` has been walked through by a human
- [ ] Cross-browser spot check completed (Chrome + Firefox minimum)
- [ ] Empty states handled
- [ ] Error states handled
- [ ] Loading states handled
- [ ] No-JS fallback tested
- [ ] Edge cases from the spec (if any) tested

## Gate behavior

- All automated scripts must exit 0
- All manual checks must be checked off by a human (recorded in commit or PR description)
- If any automated script is **missing** from `package.json`, `verify-phase ship` fails with a clear error telling the user which script to add

## Owner bypass

```bash
BFW_OWNER_OVERRIDE=1 npm run bfw:ship
```

Requires matching `owners[].email` in `.bfw-process/config.json`. Logged to `.bfw-process/overrides.log`.

**Agents: do not run this unilaterally. Only on explicit owner instruction.**
