---
layout: page
title: Maintaining Design Systems
chapterTitle: Chapter 5
permalink: /chapter-5/
---

And they made a design system, delivered a pattern library, and lived happily ever after. Right? 

Not quite.

{% include figure.html src="../images/content/trash-can.jpg" caption="" %}

There's a very real risk that a pattern library will be thrown in the trashcan right alongside all the PSDs, PDFs and other artifacts of the design process. All the time and effort that went into into making a thoughtful design system and pattern library goes down the drain.

Why does this happen?

> A style guide is an artifact of design process. A design system is a living, funded product with a roadmap & backlog, serving an ecosystem. <cite>[Nathan Curtis](https://twitter.com/nathanacurtis/status/656829204235972608)</cite>

An *artifact* is something you'd find in an archaeological dig or a museum, whereas a *system* is a living, breathing entity. A pattern library can provide helpful documentation, but the simple existence of a pattern library doesn't guarantee long-term success for the underlying design system. 

## Changing minds, once again
We've already discussed the importance of resetting everyone's expectations in order to establish a more collaborative, pattern-driven workflow. In order to save our design systems from the trash can and craft successful, lasting design systems instead, we must once again fundamentally rewire people's brains.

### What is it we're making again?
We *think* we merely design and build websites. And that's true for the most part. After all, that's what our clients pay us to do, and the websites we create are the vehicles that generate money and success for an organization. So it seems natural to focus on the end product. With this mentality, the live website remains the primary focus of everyone's attention, while any pattern library exists as an offshoot that provides helpful documentation for the final product.

{% include figure.html src="../images/content/workflow-website-first.png" caption="" %}

The problem with this mentality is that you can almost see that pattern library snapping off and sliding off into the abyss.  **Once the pattern library ceases to reflect the current state of the live website, it becomes obsolete**. And when the pattern library managing the design system is no longer accurate, the website maintenance process devolves into a smattering of hotfixes and ad hoc changes, ruining all the thoughtfulness that went into creating the original design system.

In order to set a design system for long-term success, we must fundamentally shift our mentality around just what exactly it is we’re creating. Rather than thinking of the final website our primary responsibility, we must recognize that the design system is what d

The final website is still a priority, it's just not the _only_ priority. 

{% include figure.html src="../images/content/workflow-system-first.png" caption="" %}

Friction can be friendly.

### Done and done
One essential expectation to reset is the concept of *done*. Print and other physical mediums involve creating tangible objects that have a sense of finality to them. That simply doesn't exist in the digital world. The ephemeral nature of the Web means that changes can happen  is something that needs to be extolled to your clients, colleagues, and stakeholders. If we're to create living design systems, we need to recognize that the Web is never done, and that our work can and should be constantly evolved and improved upon over time.

- Scope of work. 
- Build contracts that revisit the design system
- Anna Debenham (find link to Styleguides podcast episode where Anna talks about building in )

## Maintainable Design Systems


### Make It Maintainable
- Don't let it die on the vine and become obsolete
- Sharing CSS and JS with the production environment is easy, but sharing templates is tough
- Templating language should match the production environment
- [Using Grunt with Pattern Lab](http://bradfrost.com/blog/post/using-grunt-with-pattern-lab/)

## The holy grail
- Holy Grail is when the pattern library and production environment are perfectly in sync. Make a change to a pattern library, and anywhere the pattern is included in production will be updated.
- [Rizzo](http://rizzo.lonelyplanet.com/) by Lonely Planet has accomplished this.

### Strategies for achieving the holy grail
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
- Notifications - Regular E-mail newsletters, blog updates, etc, whenever things change, Slack integrations 
- Monitor progress - Lonely Planet performance

## Go forth and be atomic
