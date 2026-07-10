# Common Failure Modes (and how to avoid them)

These are the ways BFW projects go wrong. Read this once, then watch for the patterns in yourself.

| Failure | Why it happens | Prevention |
|---|---|---|
| Building before speccing | Feels faster, is slower | `SPEC.md` is gated — no Phase 3+ without `status: approved` |
| Custom UI components instead of Eddie | Unfamiliarity with Eddie | Always check Eddie docs first; escalate to a recipe if Eddie doesn't cover it |
| Hardcoded design values | Habit | Only `--ed-*` tokens, zero exceptions; missing tokens get filed as issues, not worked around |
| Skipping tests "just this once" | Time pressure | Tests are part of the task definition, not a bonus |
| Nuxt when Eleventy was right | "Future-proofing" | Check escalation signals strictly; if none apply, Eleventy wins |
| Scope creep mid-build | Spec gaps | Surface gaps as amendments or issues; never silently build around them |
| No docs after shipping | "Will do it later" | Docs are part of Phase 6, not optional |
| Skipping Phase 1 because the brief "seems obvious" | Overconfidence | Phase 1 is cheap; re-reading the brief costs minutes and prevents rebuilds |
| Agent bypassing ship gate on its own | Over-eagerness | Owner-only, human-initiated only, logged |
| Accessibility as a cleanup pass | "I'll add ARIA at the end" | a11y is during, not after. Semantic HTML first. |
| Quick-mode code shipped to prod without promotion | "It works, let's go" | "Do it for real now" → Phase 2 gate → Phase 5 gauntlet. Every time. |
| Silently rewriting quick-mode code during promotion | Agent over-helpfulness | Promotion is refinement, not rewrite, unless the spec review explicitly demands a rewrite |
| Non-owner asking to bypass ship gate | Social pressure | There is no non-owner bypass. They fix the failing checks. |
