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

In order to set our design systems up for long-term success, we must fundamentally shift our mentality around just what exactly it is we’re creating. Rather than thinking of the final product our sole responsibility, we must recognize that the design system is what drives both the final website and pattern library.

{% include figure.html src="../images/content/workflow-system-first.png" caption="" %}

This "design system first" mentality inserts a bit of friction into the maintenance process, and that **friction can be friendly**. It forces us to step back and consider how future client requests, feature additions, and iterations impact the overall system rather than only a piece of the final website. 

Say for instance you're working on an e-commerce site, and you run a test to find a custom-styled dropdown menu on the product detail page isn't performing as well as the browser's default dropdown menu. One course of action is to simply remove the custom-styled dropdown from that page and call it a day. However, considering the entire design system rather than just the product detail page might cause you to take a step back and ask, "If this custom dropdown menu isn't performing well here, perhaps it's not performing well elsewhere?" After digging into the issue further, you find the best course of action is to modify the dropdown pattern in the design system to remove the custom styling. Now anywhere the dropdown pattern appears will reflect those changes and likely see similar performance improvements.

That is just one example of how design system thinking can lead to broader changes. **Broken behavior and opportunities to enhance the experience will be realized at the *page* level, but those changes often should be acted on at the *system* level**. Adding this bit of worthwhile friction into your workflow  ensures improvements are shared across the entire design system, and that the system isn't eroded by a continuous series of one-off changes.

### Done and done
Anther expectation we must revisit is the concept of *done*. Print and other physical mediums involve creating tangible objects that have qualities of permanence and finality to them. Those qualities simply don't exist in the digital world. The ephemeral nature of the Web means that changes can happen all the time. Again, pixels are cheap, and your clients, colleagues, and stakeholders should embrace this fact. We should create living design systems that adapt to the ever-shifting nature of the medium, user needs, and the needs of the business. The Web is never done, and our work can and should be constantly evolved and improved upon over time.

This shift in thinking fundamentally impacts the scope of our work. Folks that work in the client services business are used to riding off into the sunset once the project is delivered, returning to the 
- Build contracts that revisit the design system Anna Debenham (find link to Styleguides podcast episode where Anna talks about building in )

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
