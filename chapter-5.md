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
We've already discussed the importance of resetting everyone's expectations in order to establish a more collaborative, pattern-driven workflow. In order to save our design systems from the trash can and craft successful, lasting design systems instead, we must once again fundamentally rewire people's brains.

### What is it we're making again?
We *think* we merely design and build websites. And that's true for the most part. After all, that's what our clients pay us to do, and the products we create are the vehicles that generate money and success for an organization. So it seems natural to focus on the final implementations rather than the underlying system. With this mentality, the live products remain the primary focus of everyone's attention, while any pattern library exists as an offshoot that provides helpful documentation for the final products.

{% include figure.html src="../images/content/workflow-website-first.png" caption="" %}

The problem with this mentality is that you can almost see that pattern library snapping off and sliding off into the abyss.  **Once the pattern library ceases to reflect the current state of the products it serves, it becomes obsolete**. And when the pattern library managing the design system is no longer accurate, the website maintenance process devolves into a smattering of hotfixes and ad hoc changes, ruining all the thoughtfulness that went into creating the original design system.

In order to set our design systems up for long-term success, we must fundamentally shift our mentality around just what exactly it is we’re creating. Rather than thinking of the final product our sole responsibility, we must recognize that the design system is what drives both the final website and pattern library.

{% include figure.html src="../images/content/workflow-system-first.png" caption="" %}

This "design system first" mentality inserts a bit of friction into the maintenance process, and that **friction can be friendly**. It forces us to step back and consider how future client requests, feature additions, and iterations impact the overall system rather than only a piece of the final website. 

Say for instance you're working on an e-commerce site, and you run a test to find a custom-styled dropdown menu on the product detail page isn't performing as well as the browser's default dropdown menu. One course of action is to simply remove the custom-styled dropdown from that page and call it a day. However, considering the entire design system rather than just the product detail page might cause you to take a step back and ask, "If this custom dropdown menu isn't performing well here, perhaps it's not performing well elsewhere?" After digging into the issue further, you find the best course of action is to globally modify the dropdown pattern in the design system to remove the custom styling. Now anywhere the dropdown pattern appears will reflect those changes and likely see similar performance improvements.

That is just one example of how design system thinking can lead to broader changes. **Broken behavior and opportunities to enhance the experience will be realized at the *page* level, but those changes often should be acted on at the *system* level**. Adding this bit of worthwhile friction into your workflow  ensures improvements are shared across the entire design system, and that the system isn't eroded by a continuous series of one-off changes.

### Done and done
Another expectation we must revisit is our definition of *done*. Creating things for print and other physical mediums involve making permanent, tangible objects. There's a sense of finality when creating things for a world of atoms. That concept simply doesn't exist in the digital world, which means change can happen with much less effort and friction than other mediums. **Clients, colleagues, and stakeholders should embrace the pliable nature of the digital world to create living design systems that adapt to the ever-shifting nature of the medium, user needs, and the needs of the business**. 

This shift in thinking fundamentally impacts the scope of our work. Folks working in the client services business are often used to delivering a project in a tidy package then riding off into the sunset. Internal teams don't fair much better, since they tend to float from one initiative to the next. Whether you're part of an internal team or are an external gun for hire, I'm guessing you've experienced the shortcomings of project-based work. We tend to talk about a future that never comes, and instead we set it, forget it, then move onto the next shiny project.

If we're committed to creating genuinely useful work that truly meets the needs of our clients and organizations, we must fundamentally redefine the scope of our work. As Nathan Curtis says, a design system shouldn't be a *project* with a finite scope, but rather a *product* meant to grow and evolve over time:

> Focusing on style guide delivery as the climax is the wrong story to tell. A system isn’t a project with an end, it’s the origin story of a living and evolving product that’ll serve other products. <cite>[Nathan Curtis](https://medium.com/eightshapes-llc/a-design-system-isn-t-a-project-it-s-a-product-serving-products-74dcfffef935#.4umtnfxsx)</cite>

The web is never done, and the creation of a design system is merely the first step in a long (and hopefully fruitful!) journey. A design system should be a long-term commitment with the ambitious goal of revolutionizing how your organization creates digital work. Exciting, eh?! So how do we make sure that happens?

## Creating Maintainable Design Systems
As you embark on this journey, let's talk about things you can do to craft a design system that sets your organization up for long-term success. How do you create a design system that takes root and becomes an essential part of your organization's workflow? What pitfalls do you need to be on the lookout for? How do you ensure the design system yields big results? Here's what we need to do:

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
Your initial style guide may begin its life as a side project, result of a weekend hackathon, or as the brainchild of one or two ambitious team members. As we discussed in the last chapter, your client or boss doesn't even have to know that you're creating a thoughtful design system and accompanying pattern library. Remember: ask forgiveness, not permission!

Organic beginnings are all well and good, but in order to create a truly impactful design system that creates longterm success for your organization, **the design system needs to evolve into an officially-sanctioned endeavor rather than a side project**. That means thinking of it as a product and allocating real time, budget, and people to it.

Convincing stakeholders to commit a large chunk of money, time, and resources upfront for a design system can be extremely challenging. So what are we to do? Here's my advice:

1. Make a thing.
2. Show that it's useful.
3. Make it official.

Let's break down these steps a bit further.

### Step 1: make a thing
You have to start somewhere, and having something is better than nothing. Pick a project that would be a great pilot for establishing your design system, follow a process similar to the one discussed in [chapter 4](/chapter-4/), think about the atomic design mental model detailed in [chapter 2](/chapter-2/), and you'll end up with a solid foundation for a thoughtful design system and pattern library that helps your team work more effectively and thoughtfully. 

Take the time to package your UI patterns in a pattern library and get it ready to shop around. I've talked to several ambitious team members who have built the basic gist of a pattern library over the course of a weekend. This effort makes all the difference in the world since it gives something tangible for stakeholders to react to. Again: *show, don't tell*.

### Step 2: show that it's useful 
With a nascent-yet-tangible design system in place, you can have a more meaningful conversation with people who control money, scheduling, and resources. You can discuss exactly how the design system helped save time and money (see *[Pitching Patterns](/chapter-4/#pitching-patterns)* in the last chapter), then paint a picture for how those benefits would scale even further if the organization invested in an official, robust design system. 

Get team members across disciplines who have directly benefitted from the initial system to back you up, and pull in other people who are sympathetic to the cause that would stand to benefit from an expanded design system. 

### Step 3: make it official
You've proven the value of your design system and presented a roadmap for how to make it even better. With any luck your organization will commit to making the design system an Official Thing. 

With approval from the highest levels, you're now able to put a plan into action that involves: allocating and/or hiring people to work on the design system, developing a plan to make the design system more comprehensive, establish a governance strategy, and lay out a product roadmap for the design system.

Now it's worth pointing out that things might not shake out the way you hoped. Despite demonstrating real value and presenting a concrete plan of action, higher ups still might shoot your initiative down. **Don't be discouraged**. You may have lost the battle, but you certainly haven't lost the war. Your team should continue to grow and extend the design system (in whatever capacity you can) until its value becomes undeniable. As more people benefit from the system, you'll have a groundswell of support to help push the endeavor through.

### Establishing a design system team
With the design system initiative approved, it's now time to put the right people and processes in place to ensure the system flourishes for your organization.

#### Design system makers and users
First things first. It's important to recognize that **there will inevitably be people at the organization that help <em>make and maintain</em> the design system, and there will be other people who will be <em>users</em> of the design system**. These two groups may not be mutually exclusive, but establishing the roles of makers and users is important.

When I talk about establishing a more collaborative process like the one I detailed in the last chapter, I inevitably hear people who work at large organizations say, "but Brad, we have hundreds (or thousands) of developers working on our products, so getting all those people to collaborate and contribute like that would be far too difficult."

They're likely right. It would be ideal if the entire organization adopted more nimble, collaborative processes, but the daunting logistics around such an effort makes it improbable. Not everyone in the organization needs to directly contribute to the design system, but someone (or more likely, some people) must take ownership of it.

**The design system <em>makers</em> are the ones who architect, create, and maintain the system**, and they need to work closely together to ensure that the system is smart, flexible, scalable, and addresses the needs of the business and users. **The design system <em>users</em> are the teams across the organization who will take the system and employ its interface patterns to specific applications**. 

**The design system <em>makers</em> and design system <em>users</em> need to maintain a close working relationship** to ensure the patterns defined within the system serve the needs of the applications and all documentation is clear. **Makers provide a birds-eye perspective of the entire ecosystem the design system serves, while users provide an on-the-ground perspective focused on the application of the system**. Both perspectives are critical to the success of the design system, which is why it's so important for makers and users to have a healthy relationship that involves frequent communication and collaboration. 

#### Who are the design system makers?
Who updates the design system? Who approves changes? Who interfaces with the users of the design system to make sure it's addressing their needs? Who gets to decide which patterns stay, go, or need tweaked? 

The answers to these questions **will very much depend on the size and setup of your organization**.

**Large organizations** like Salesforce maintain an official *design systems team*, which currently includes about a dozen full-time employees last I heard. That dedicated team is responsible for governing the design system and making sure it's meeting the needs of the myriad internal product teams, as well as external developers that build things on the company's platform. When a design system is serving literally thousands of  users, it's a smart idea to dedicate at least a few full-time employees to maintain the system.

{% include figure.html src="../images/fpo.png" caption="" %}

**Smaller organizations** most likely don't have the luxury of building an entire team to service a design system. Team members in smaller organizations have to wear many (hopefully stylish!) hats out of necessity, so governing the design system will likely become another responsibility. This may sound like an added burden ("oh great, yet another thing I'm responsible for that doesn't involve a pay raise!"), but this particular hat should be a joy to wear as it improves the efficiency and quality of all other work. Hooray for design systems! 

Typically, design system makers at smaller organizations will be senior-level staff who have the experience and authority necessary to make thoughtful decisions and also enforce the design system.

{% include figure.html src="../images/fpo.png" caption="" %}

And then there are **external agencies, contractors, and consultants**. What is the role of an external party when it comes to long-term maintenance of a client's design system? On one hand, external parties are at a bit of a disadvantage since they don't actually work for the client's organization. A successful design system needs to become a part of an organization's DNA, and since external parties exist outside the company's walls, their influence is intrinsically limited.

But on the other hand, **external parties can often provide a sense of perspective** that's hard to see while working inside a company. This is where outsiders can really shine. In my work as a consultant, I work with organizations to establish long-term design system maintenance strategies and help get the right people and processes in place. While the long-term success of the system will ultimately be up to the organization themselves, external parties can teach them to fish and provide important strategic guidance, feedback, and perspective. 

{% include figure.html src="../images/fpo.png" caption="" %}

#### Who are the design system users?
Who are the people responsible for using the design system to build new features and applications? Who are the people that communicate with the system makers to report issues and request features?

Again, the answers to these questions will largely depend on your organization's size and structure.

**Design system users may be the same team creating the design system, separate development teams within your organization, junior-level designers and developers, third-party agencies, offshore developers, and/or other external development teams**. 

Users' proximity to and involvement in the creation of the design system will undoubtedly vary. You may work on a singular product at a scrappy startup, so your small team very well may be the ones simultaneously creating and using the design system.  Or you may work at a large multi-national corporation with development teams and third-party partners scattered all across the globe. If this is the case, design system makers and users may seldom (or ever) meet, which means that helpful documentation and a sharp birds-eye perspective becomes that much more important. 

{% include figure.html src="../images/fpo.png" caption="Spectrum of design system users" %}

One of the biggest advantages of establishing a sound design system is that it allows organizations to scale best practices. If all those best practices — responsiveness, accessibility, performance, UX, ergonomics, and so on — are baked into the system's UI patterns, users can simply plug in those patterns and reap the rewards. This means design system users don't have to be senior-level designers or developers to produce good work; the design system serves as quality control to help users apply best practices regardless of their skill level.

### Design system team makeup
**A cross-disciplinary team should be established in order to manage, maintain, and extend the system**. All disciplines at an organization — UX designers, visual designers, content strategists, frontend developers, backend developers, product managers, project managers, executives, and other stakeholders — have a unique perspective that can undoubtedly inform and shape the work. Incorporating these perspectives into the system is important, but doesn't necessarily require every discipline to  always be actively involved in developing the design system.

There will inevitably be disciplines that actively do the work, while other disciplines will take on more of an advisory role. The disciplines responsible for designing and building the user interface — UX designers, visual designers, frontend developers — will likely serve as the hands that do the work and make updates to the design system. They should work collaboratively (as detailed in the last chapter) and coordinate with the other disciplines.

Other disciplines may not be the ones actively doing the work, but must be consulted to make sure their perspectives are properly reflected in the system. Backend engineers need to make the team aware of any architectural decisions that would affect the frontend UI, executives need to make the team aware of important initiatives that will affect the role and utility of the system, and of course design system users need to coordinate with the makers to ensure the system is serving the needs of individual applications. 

{% include figure.html src="../images/fpo.png" caption="" %}

## Make it maintainable
Many pattern libraries fall into a state of disrepair because the level of effort required to update patterns or documentation is far too high. If a pattern library is difficult to update, people will eventually stop updating it and the pattern library will die on the vine. Making updates to UI patterns and documentation should be as frictionless as possible, and reducing this friction involves careful consideration from both a technological and workflow standpoint.

### The Holy Grail
**The design system Holy Grail involves creating an environment where the pattern library and production environment are perfectly in sync**. The idea of the Holy Grail is that you can make a change to a UI pattern, and those changes will be automatically reflected in both the pattern library and anywhere the pattern is included in production. 

{% include figure.html src="../images/content/workflow-system-first.png" caption="The Holy Grail of design systems is one where making a change to the system will " %}

Sounds like a dream, right?

As it turns out, this dream can be a reality. Organizations like Lonely Planet established a Holy Grail-style design system called [Rizzo](http://rizzo.lonelyplanet.com/) to serve their products. 

{% include figure.html src="../images/fpo.png" caption="" %}

- Sharing CSS and JS with the production environment is relatively easy, but sharing markup is tough.
- Using HTML templating languages create Templating language should match the production environment - The closer you get to . 
- Look for opportunities to automate documentation 
- [Using Grunt with Pattern Lab](http://bradfrost.com/blog/post/using-grunt-with-pattern-lab/)

How can you set up your applications and pattern library to achieve the Holy Grail? Developer Marcelo Somers outlined several methods for thoughtfully keeping your pattern library and production environments in sync. [Chasing the holy grail](https://medium.com/@marcelosomers/chasing-the-holy-grail-bbc0b7cce365#.vy45rkm7m)

There are a number of reasons why an organization may not be able to achieve the Holy Grail. Perhaps your organization has digital products on different platforms using wildly different technologies. For instance, the U.S. Web Digital Standards are a collection UI components and visual styles for websites. However, due to the decentralized nature of the , it would be impossible to 

When technology can't achieve maintainable design systems, you must rely on creating a culture that communicates change and enforces that friction 

## Make it cross-disciplinary
Far too often, pattern libraries jump straight into code snippets and usage for the benefit of the developers that will be making use of the patterns. Of course a pattern library should be helpful for the hands-on design system users, but treating it as solely a developer resource limits its potential.

A pattern library has the opportunity to serve as a watering hole for the entire organization, helping establish a common vocabulary for every discipline that's invested in the success of the design system. What does that entail?

Take the carousel (please!). This component is amazingly complex from an organizational standpoint. A homepage carousel on an e-commerce website requires input from a myriad of disciplines across the organization. Business owners and editorial staff must choose products that align with . Copywriters must ensure the copy stays within character limits. Art directors must ensure the aesthetic design is pleasing and the product photography is legible across every screen size.  UX designers, front-end people, backend people, and so on.

{% include figure.html src="../images/fpo.png" caption="Spectrum of design system users" %}

As mentioned earlier in the chapter, every discipline can and should influence the design system. The pattern library containing that carousel pattern should be accessible to all these disciplines, and should contain documentation from each perspective

## Make it approachable
- No shocker here, but good design leads to more usage.
- Avoid exposing tons of code right out of the gate as it might discourage other disciplines from looking at it ("Oh this must not be for me")

## Make it visible
- Make it public.
- Recruitment, recruitment, recruitment.
- Jina Bolton went to Salesforce after seeing their Salesforce1 style guide. 

## Make it bigger
In chapter 1, we discussed the six different types of style guides. When a design system has proven to be valuable and there's a solid home base set up to house it, there's an opportunity to extend that home to include things like voice and tone, brand, code, design principles and writing guidelines. Now, every organization may not necessarily need all of these elements, but the point is that 

## Make it agnostic
- The more agnostic pattern names are, the more versatile and reusable they become.
- Nicole Sullivan [media object](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/)
- Naming things is really freaking hard. 

## Make it contextual
- Demonstrate context. Where are these patterns utilized? 
- Pattern Lab lineage
- Helps with QA efforts. If changes are made to a pattern, you'll know exactly which templates will need retested to ensure things held up. 

## Make it last

### Managing change 
Change is the only constant, as they say. A successful design system is able to roll with the punches, adapt to feedback, **Creating a clear governance plan is essential to make sure your design system will stand the test of time**. 

- Schedule regular reviews of the patterns. 
- Deprecate patterns https://github.com/salesforce-ux/sass-deprecate
Making a design system last means consistently . It needs to be visible and stay in the front of everyone's minds. Without a communication strategy in place, how will everyone know when things change?

### Communicating change
- Publish updates (Material Design example)
- Notifications - Regular E-mail newsletters, blog updates, etc, whenever things change, Slack integrations 
- Monitor progress over time - Lonely Planet's Rizzo design system tracks performance metrics over time.
- Revisit our work once time has We should contracts that revisit the design system Anna Debenham.

## Go forth and be atomic

