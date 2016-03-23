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

**An artifact is something you'd find in an archaeological dig or a museum, whereas a system is a living, breathing entity**. A pattern library can provide helpful documentation, but the simple existence of a pattern library doesn't guarantee long-term success for the underlying design system. 

## Changing minds, once again
We've already discussed the importance of resetting everyone's expectations in order to establish a more collaborative, pattern-driven workflow. In order to save our design systems from the trash can and instead craft successful, lasting design systems, we must once again fundamentally rewire people's brains.

### What is it we're making again?
We *think* we merely design and build websites. And that's true for the most part. After all, that's what our clients pay us to do, and the products we create are the vehicles that generate money and success for an organization. So it seems natural to focus on the final implementations of the design system. With this mentality, the live products remain the primary focus of everyone's attention, while any pattern library exists as an offshoot that provides helpful documentation for the final products.

{% include figure.html src="../images/content/workflow-website-first.png" caption="" %}

The problem with this mentality is that you can almost see that pattern library snapping off and sliding off into the abyss.  **Once the pattern library ceases to reflect the current state of the products it serves, it becomes obsolete**. And when the pattern library managing the design system is no longer accurate, the website maintenance process devolves into a smattering of hotfixes and ad hoc changes, ruining all the thoughtfulness that went into creating the original design system.

In order to set our design systems up for long-term success, we must fundamentally shift our mentality around just what exactly it is we’re creating. Rather than thinking of the final product our sole responsibility, we must recognize that the design system is what drives both the final website and pattern library.

{% include figure.html src="../images/content/workflow-system-first.png" caption="" %}

This "design system first" mentality inserts a bit of friction into the maintenance process, and that **friction can be friendly**. It forces us to step back and consider how future client requests, feature additions, and iterations impact the overall system rather than only a piece of the final website. 

Say for instance you're working on an e-commerce site, and you run a test to find a custom-styled dropdown menu on the product detail page isn't performing as well as the browser's default dropdown menu. One course of action is to simply remove the custom-styled dropdown from that page and call it a day. However, considering the entire design system rather than just the product detail page might cause you to take a step back and ask, "If this custom dropdown menu isn't performing well here, perhaps it's not performing well elsewhere?" After digging into the issue further, you find the best course of action is to globally modify the dropdown pattern in the design system to remove the custom styling. Now anywhere the dropdown pattern appears will reflect those changes and likely see similar performance improvements.

That is just one example of how design system thinking can lead to broader changes. **Broken behavior and opportunities to enhance the experience will be realized at the *page* level, but those changes often should be acted on at the *system* level**. Adding this bit of worthwhile friction into your workflow  ensures improvements are shared across the entire design system, and that the system isn't eroded by a continuous series of one-off changes.

### Done and done
Anther expectation we must revisit is our definition of *done*. Creating things for print and other physical mediums involve making permanent, tangible objects. There's a sense of finality when creating things for a world of atoms. That sense of finality simply doesn't exist in the digital world, which means change can happen with much less effort and friction than other mediums. **Clients, colleagues, and stakeholders should embrace the pliable nature of the digital world to create living design systems that adapt to the ever-shifting nature of the medium, user needs, and the needs of the business**. 

This shift in thinking fundamentally impacts the scope of our work. Folks working in the client services business are often used to delivering a project in a tidy package then riding off into the sunset. Internal teams don't fair much better, since they tend to float from one initiative to the next. Whether you're part of an internal team or are an external gun for hire, I'm guessing you've experienced the shortcomings of project-based work. We tend to talk about a future that never comes, and instead we set it, forget it, then move onto the next shiny project.

If we're committed to creating genuinely useful work that truly meets the needs of our clients and organizations, we must fundamentally redefine the scope of our work. As Nathan Curtis says, a design system shouldn't be a *project* with a finite scope, but rather a *product* meant to grow and evolve over time:

> Focusing on style guide delivery as the climax is the wrong story to tell. A system isn’t a project with an end, it’s the origin story of a living and evolving product that’ll serve other products. <cite>[Nathan Curtis](https://medium.com/eightshapes-llc/a-design-system-isn-t-a-project-it-s-a-product-serving-products-74dcfffef935#.4umtnfxsx)</cite>

The web is never done, and the creation of a design system is merely the first step in a long (and hopefully fruitful!) journey. A design system should be a long-term commitment with the ambitious goal of revolutionizing how your organization creates digital work. Exciting, eh?! So how do we make sure that happens?

## Creating Maintainable Design Systems
As you embark on this journey, let's talk about things you can do to craft a design system that sets your organization up for long-term success. How do you create a design system that takes root and becomes an essential part of your organization's workflow? What pitfalls do you need to be on the lookout for? How do you ensure the design system yields big results?

- Make it official.
- Make it maintainable.
- Make it cross-disciplinary.
- Make it approachable.
- Make it visible.
- Make it bigger.
- Make it agnostic.
- Make it contextual.
- Make it last.

Let's go into each one of these points in more detail.

## Make it official
Your initial style guide may begin its life as a side project, result of a weekend hackathon, or as a brainchild of one or two ambitious team members. As we discussed in the last chapter, your client or boss doesn't even have to know that you're creating a thoughtful design system. Remember: ask forgiveness, not permission!

Organic beginnings are all well and good, but in order to create a truly impactful design system that creates longterm success for your organization, **the design system needs to evolve beyond being a pet project and instead become an officially-sanctioned endeavor**. That means it has real time, budget, and people allocated to it.

I think it's extremely challenging to convince stakeholders to commit a large chunk of money, time, and resources to creating a design system. Again, I highly recommend taking tangible steps towards creating a design system with or without your client's or boss's blessing. So here's my advice:

1. Make a thing.
2. Show that it's useful.
3. Make it official.

### Step 1: Make a thing. 
You have to start somewhere. Pick a project that would be a great pilot for your design system. Using the atomic design methodology detailed in chapter 2  

### Step 2: Show that it's useful. 
With the genesis of a design system in place, you can give your bosses something to react to. You can now talk them through how it helps save time and money (see *Pitching Patterns* in the last chapter). Armed with an initial design system, a pilot project, it 

### Step 3: Make it official
Get the organization to commit to making the design system an Official Thing. With leadership approval, you'll be able to put a plan into action that involves allocating and/or hiring people to work on the design system.  to make the design system more complete, discuss governance, allocations 

### Governance model
What's the plan of attack for managing this thing in the long-run? What if something changes? How 

### Establishing a Design System Team
Who updates it?
Who approves changes?
Who interfaces with the users of the design system to make sure it's addressing their needs?
Who is involved with maintaining a living, breathing design system? A team needs to manage. 

Cross-disciplinary team should be established responsible for managing the 

## Make It Maintainable
- The pattern library that showcases the  surefire way of making a design system that dies on the vine. It needs to become an an integral part of the teams' workflow. Needs to closely match the technology (or technologies) that use the design system.
- Sharing CSS and JS with the production environment is easy, but sharing templates is tough
- Templating language should match the production environment - The closer the 
- [Using Grunt with Pattern Lab](http://bradfrost.com/blog/post/using-grunt-with-pattern-lab/)

### The Holy Grail
- Holy Grail is when the pattern library and production environment are perfectly in sync. Make a change to a pattern library, and anywhere the pattern is included in production will be updated.
- [Rizzo](http://rizzo.lonelyplanet.com/) by Lonely Planet has accomplished this.

### Strategies for achieving the Holy Grail
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

## Make it bigger

## Make it agnostic
- The more agnostic pattern names are, the more versatile and reusable they become.
- Nicole Sullivan [media object](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/)

## Make it contextual
- Demonstrate context. Where are
- Pattern Lab lineage

## Make it last
- Publish updates (Material Design example)
- Notifications - Regular E-mail newsletters, blog updates, etc, whenever things change, Slack integrations 
- Monitor progress - Lonely Planet performance
- Revisit our work once time has We should contracts that revisit the design system Anna Debenham.

> When we provide a pattern library to a client, we hope that they’ve got everything they need. If we’ve done our job right, then they’ll be able to combine patterns in ways we haven’t foreseen to create entirely new page types. https://adactio.com/journal/7276

## Go forth and be atomic
