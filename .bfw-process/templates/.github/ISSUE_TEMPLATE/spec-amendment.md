---
name: SPEC.md Amendment
about: Record a change to SPEC.md after Phase 4 has begun
title: "[Spec Amendment] "
labels: spec-amendment
assignees: ''
---

## What's changing in the spec

_Plain-English description of the change. Which section of `SPEC.md` is affected?_

## Why the change is needed

_What did implementation reveal that the original spec missed? Was it a scope gap, a technical constraint, a user feedback, a design decision?_

## Impact on work already done

_Does this invalidate any completed tasks? Any tests that need to change? Any documentation to update?_

## Impact on non-goals

_Does this change any of the explicit non-goals? (If so, flag loudly — non-goal changes are the riskiest amendments.)_

## Who approved this amendment

_An amendment after Phase 4 has begun needs an owner sign-off. Who approved it?_

## Amendments array entry

_Copy this into `SPEC.md` frontmatter under `amendments:`._

```yaml
- date: YYYY-MM-DD
  author: <name>
  summary: <one-line summary of the amendment>
```
