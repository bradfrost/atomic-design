# {{project_name}}

> _One-line description of the project. Replace this when you fill in the rest._

A Brad Frost Web project built with the [BFW Software Creation Process](https://github.com/Brad-Frost-Web/bfw-process).

## Stack

- [Eddie Design System](https://ds.bradfrost.com) for all UI
- <!-- Eleventy | Nuxt | vanilla Node --> for the framework layer
- Netlify for hosting
- WCAG 2.1 AA accessibility baseline

## Process

This project follows the BFW Software Creation Process. Mode and owners are defined in `.bfw-process/config.json`. Rules are encoded in `AGENTS.md` (cross-agent), `CLAUDE.md` (Claude Code), and `.openhands/microagents/` (OpenHands).

- Read `SPEC.md` before making architectural changes.
- Phase 5 (ship-readiness) is a hard gate: run `npm run bfw:ship` before deploying.
- Ship-gate bypass is available to BFW co-owners only.

## Getting started

```bash
npm install
npm run dev
```

## Deviations from BFW defaults

_If this project deviates from the BFW default stack or process in any way, document it here. What changed, and why._

## License

<!-- Fill in project license -->
