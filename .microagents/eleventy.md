---
name: eleventy-content-sites
type: knowledge
agent: CodeActAgent
triggers:
  - eleventy
  - 11ty
  - content site
  - static site
  - markdown site
  - blog
---

# Eleventy (11ty) for Content/CMS Sites

Eleventy is the default framework for **content / CMS / static** BFW sites. Most BFW projects land here.

## When Eleventy is the right choice

- Content-driven site (blog, docs, marketing, portfolio)
- No authentication or user sessions
- No heavy client-side state
- No real-time features
- No deep database integration

If any of those conditions flip, consider Nuxt (see the `nuxt` microagent).

## Default setup

- Eleventy with the `@11ty/eleventy` package
- Nunjucks or Liquid templates (either is fine; pick one and be consistent)
- Eddie Web Components consumed directly in templates via `<script type="module">` imports
- CSS via Eddie tokens and component-level scoped styles from Eddie components themselves
- Netlify for hosting and build

## Gotchas

- Eddie components are web components (Lit-based). Eleventy generates static HTML; the components hydrate on page load. This works, but make sure progressive enhancement is honored: core content (text, images, links) must be readable without JS.
- SSR of web components is optional and complex. Default to client-side hydration unless the spec demands SSR for performance or SEO.
- Eleventy's file-based routing is powerful. Use collections and data cascade idiomatically; don't fight the framework.

## Do not

- Do not reach for Nuxt just because it's more familiar. Check the Nuxt escalation signals first.
- Do not write custom CSS frameworks on top of Eleventy. Eddie tokens + Eddie components is the layer.
- Do not add heavy client-side bundles to a static site. If you're shipping a SPA inside Eleventy, you probably wanted Nuxt.
