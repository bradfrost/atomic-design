---
name: nuxt-apps
type: knowledge
agent: CodeActAgent
triggers:
  - nuxt
  - auth
  - authentication
  - session
  - realtime
  - websocket
  - database
  - vue
---

# Nuxt for Apps (Auth / State / Realtime)

Nuxt is the default for BFW projects that need **real application behavior** beyond what a static site can do. It is **not** the default for content sites — use Eleventy for those.

## Nuxt escalation signals

Only use Nuxt when at least **one** of these applies:

- Authentication / user sessions required
- Heavy client-side state management
- Deep database integration
- Real-time features (websockets, SSE, live updates)
- Complex API orchestration

If **none** of these apply, the answer is Eleventy + Eddie. "Future-proofing" is not a Nuxt signal.

## Default setup

- Nuxt 3+ with Vue 3
- Eddie Web Components consumed as custom elements (Vue supports them natively)
- `@nuxtjs/tailwindcss`, `@nuxtjs/ui`, or any other design/utility framework: **prohibited**. Eddie only.
- Pinia for state if needed
- Server routes (`server/api/`) for backend endpoints
- Netlify for hosting (or Netlify Functions for serverless)

## Using Eddie Web Components in Vue/Nuxt

- Configure Vue to recognize custom elements (`isCustomElement` in Vite config) so Vue doesn't warn about unknown tags
- Import Eddie components in `plugins/` or `app.vue` so they're registered before the app mounts
- Pass data via attributes/props and listen for events with `@`; same as any other Vue component

## Auth

- Sessions and user auth are the most common reason to reach Nuxt. Use `nuxt-auth` or a minimal custom implementation; don't roll your own from scratch unless the spec demands it.
- Cookie/session handling has security implications — don't improvise.

## Progressive enhancement in Nuxt

- Nuxt supports SSR by default. Use it. SSR + hydration gives you working HTML without JS for the initial paint.
- For Eddie components, ensure they degrade to semantic HTML when JS is disabled (this is an Eddie-side responsibility, but verify in your build).

## Do not

- Do not reach for Nuxt for a marketing site "in case we need auth later." YAGNI is a signal here. Add auth with Nuxt later if needed, not Nuxt preemptively.
- Do not mix Tailwind, Vuetify, PrimeVue, or any other UI system into a BFW Nuxt project. Eddie is the system.
