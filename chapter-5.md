---
layout: page
title: Maintaining Design Systems
chapterTitle: Chapter 5
permalink: /chapter-5/
---

And they made a design system, delivered a pattern library, and lived happily ever after. Right? 

Not quite.

{% include figure.html src="../images/content/trash-can.jpg" caption="" %}

If Throw the design system in the trashcan, right along side the PSDs, PDFs and other artifacts
- There's a very real risk of a lot of time and effort going into making a design system and accompanying pattern library, only to have it die on the vine.
- How to prevent this?

> A style guide is an artifact of design process. A design system is a living, funded product with a roadmap & backlog, serving an ecosystem. <cite>[Nathan Curtis](https://twitter.com/nathanacurtis/status/656829204235972608)</cite>

Once again, this means we must reset peoples' expectations about  what it is we're making

[circle images]

### Done and done
One essential expectation to reset is the concept of *done*. Print and other physical mediums involve creating tangible objects that have a sense of finality to them. That simply doesn't exist in the digital world. The ephemeral nature of the Web is something that needs to be extolled to your clients, colleagues, and stakeholders. If we're to create living design systems, we need to recognize that the Web is never done, and that our work can and should be constantly evolved and improved upon over time.

## Maintainable Design Systems

### Make It Maintainable
- Don't let it die on the vine and become obsolete
- Sharing CSS and JS with the production environment is easy, but sharing templates is tough
- Templating language should match the production environment
- [Using Grunt with Pattern Lab](http://bradfrost.com/blog/post/using-grunt-with-pattern-lab/)

## The Holy Grail
- Holy Grail is when the pattern library and production environment are perfectly in sync. Make a change to a pattern library, and anywhere the pattern is included in production will be updated.
- [Rizzo](http://rizzo.lonelyplanet.com/) by Lonely Planet has accomplished this.

### Strategies for 
- [Chasing the holy grail](https://medium.com/@marcelosomers/chasing-the-holy-grail-bbc0b7cce365#.vy45rkm7m)

## Make it cross-disciplinary
- Not just a developer tool. Not just a designer tool. Every discipline invested in the success of the website should be contributing to the pattern library.
- Carousel component example - amazingly complex component requiring input from business owners, editorial staff, content strategists, art directors, UX designers, front-end people, backend people

## Make it approachable
- No shocker here, but good design leads to more usage.
- Avoid exposing tons of code right out of the gate as it might discourage other disciplines from looking at it ("Oh this must not be for me")

## Make it visible
- Make it public.
- Recruitment, recruitment, recruitment.

### Make it agnostic
- The more agnostic pattern names are, the more versatile and reusable they become.
- Nicole Sullivan [media object](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/)

### Make it contextual
- Demonstrate context. Where are
- Pattern Lab lineage

### Make it last
- Publish updates (Material Design example)
- Regular E-mail newsletters, blog updates, etc, whenever things change
- Monitor progress - Lonely Planet performance

## Go forth and be atomic
