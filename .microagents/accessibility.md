---
name: accessibility-baseline
type: knowledge
agent: CodeActAgent
triggers:
  - a11y
  - accessibility
  - wcag
  - aria
  - contrast
  - keyboard
  - screen reader
  - alt text
  - semantic html
---

# Accessibility Baseline (WCAG 2.1 AA)

BFW treats accessibility as a **baseline**, not a stretch goal. Every project — including Quick mode — ships with WCAG 2.1 AA compliance as the floor.

## The always-applicable rules

### Semantic HTML first

- `<button>` for buttons, `<a href>` for links, not `<div onclick>`
- `<nav>`, `<main>`, `<header>`, `<footer>`, `<aside>` for landmarks
- Headings in logical order (`<h1>` → `<h2>` → `<h3>`, no skips)
- `<form>`, `<label for>`, `<input>` — with labels programmatically associated
- Lists (`<ul>`, `<ol>`) for lists, not CSS fakery
- Tables (`<table>`, `<th scope>`) only for tabular data

### Keyboard navigation

- Every interactive element must be reachable with Tab
- Focus order must be logical (matches visual order)
- Focus indicators must be visible (don't `outline: none` without replacing it)
- Esc should close modals, dialogs, and menus
- Arrow keys within composite widgets (menus, tabs, listboxes)

### Color and contrast

- Body text: **4.5:1** contrast against background (WCAG AA)
- Large text (24px+ or 18.66px+ bold): **3:1**
- Non-text UI (buttons, inputs, borders): **3:1**
- Do not rely on color alone to convey information — pair with text, icon, or shape

### Images and media

- Every `<img>` has `alt`. Meaningful images get descriptive alt. Decorative images get `alt=""` (empty string, not missing attribute).
- `<svg>` used as an image: add `role="img"` and `<title>`, or `aria-label`
- Videos: captions for any spoken content. Transcripts for podcasts.

### Forms

- Every input has a programmatically associated `<label>`
- Error messages are associated with inputs via `aria-describedby` or adjacency
- On submit, focus moves to the first error (or the success message)
- Required fields are indicated in text, not just with color or `*`

### ARIA

- **ARIA only when HTML semantics don't cover it.** Never ARIA-first.
- The first rule of ARIA is don't use ARIA.
- If you find yourself adding lots of `aria-*` attributes, you're probably reaching for ARIA before checking whether a semantic element does the job.
- `aria-label`, `aria-labelledby`, `aria-describedby`, `aria-live` for announcements, `role` when standard elements aren't available.

### Progressive enhancement

- Core functionality must work without JS. Yes, even for Nuxt apps — SSR gets you most of this for free.
- Forms must submit without JS. Links must navigate without JS. Content must be readable without JS.
- JS enhances, never enables.

## How we verify

Phase 5's `bfw:verify:a11y` script runs axe (or Lighthouse's a11y audit) against the built output. Zero violations is the target. Any flagged issue gets fixed or explicitly waived in writing with rationale.

## The Eddie angle

Eddie components are built with a11y baked in. If you use Eddie correctly, you get most of this for free. If you find yourself fighting Eddie on an a11y thing, that's a signal the component is wrong — file an issue in the Eddie monorepo, don't work around it.

## Do not

- Do not leave accessibility for "a cleanup pass." It isn't one.
- Do not add ARIA to hide a bad HTML structure. Fix the HTML.
- Do not skip a11y in Quick mode. a11y baseline stays on even in Quick mode.
