---
layout: page
title: Maintaining Design Systems
chapterTitle: Chapter 5
permalink: /chapter-5/
---

And they made a design system, delivered a pattern library, and lived happily ever after. Right? 

Not quite.

{% include figure.html src="../images/content/trash-can.jpg" caption="" %}

There's a very real risk that a pattern library will be thrown in the trash can right alongside all the PSDs, PDFs and other artifacts of the design process. Despite everyone's best intentions, all the time and effort that went into making a thoughtful design system and pattern library can go straight down the drain.

How can that be?

> A style guide is an artifact of design process. A design system is a living, funded product with a roadmap & backlog, serving an ecosystem. <cite>[Nathan Curtis](https://twitter.com/nathanacurtis/status/656829204235972608)</cite>

**An artifact is something you'd find on an archaeological dig or in a museum, whereas a system is a living, breathing entity.** A pattern library can provide documentation and serve as a helpful resource, but the simple existence of a pattern library doesn't guarantee long-term success for the underlying design system. A design system needs ongoing maintenance, support, and tender loving care for it to truly thrive. 

## Changing minds, once again
We've already discussed the importance of resetting everyone's expectations to establish a more collaborative, pattern-driven workflow. To save our design systems from the trash can and craft lasting design systems instead, we must once again fundamentally rewire people's brains.

### What is it we're making again?
We *think* we merely design and build websites. And that's true for the most part. After all, that's what our clients pay us to do, and the products we create are the vehicles that generate money and success for an organization. It seems natural to focus on the final implementations rather than the underlying system. The live products remain the primary focus of everyone's attention, while any pattern library exists as an offshoot that provides helpful documentation for the final products.

{% include figure.html src="../images/content/workflow-website-first.png" caption="" %}

The problem with this mindset is that you can almost see that pattern library snapping off and sliding off into the abyss. **Once the pattern library ceases to reflect the current state of the products it serves, it becomes obsolete.** And when the pattern library managing the design system is no longer accurate, the website maintenance process devolves into a smattering of hotfixes and ad hoc changes, undoing all the thoughtfulness that went into creating the original design system.

To set up our design systems for long-term success, we must fundamentally shift our outlook about just what exactly it is we’re creating. Rather than thinking of the final products as our sole responsibility, we must recognize that the design system is what underpins the final products *and* pattern libraries.

{% include figure.html src="../images/content/workflow-system-first.png" caption="" %}

This "design system first" mentality inserts a little friction into the maintenance process, and **that friction can be friendly**. It forces us to step back and consider how any client requests, feature additions, and iterations affect the overall system rather than only a piece of the final website. 

Say you're working on an e-commerce site, and you run a test that finds a custom-styled dropdown menu on the product detail page isn't performing as well as the browser's default dropdown menu. One course of action is to simply remove the custom-styled dropdown from that particular page and call it a day. However, considering the entire design system rather than just the product detail page might cause you to take a step back and wonder, "If this custom dropdown menu isn't performing well here, perhaps it's not performing well elsewhere." After digging into the issue further, you find the best course of action is to globally modify the dropdown pattern in the design system to remove the custom styling. Now anywhere the dropdown pattern appears will reflect those changes and likely see similar performance improvements.

That is just one example of how design system thinking can lead to broader, more considered changes. **Broken behavior and opportunities to enhance the experience will be realized at the *page* level, but those changes should often be acted on at the *system* level.** Adding this bit of worthwhile friction into your workflow ensures improvements are shared across the entire design system, and that the system isn't eroded by a continuous series of one-off changes.

### Done and done
Another expectation we must revisit is our definition of *done*. Creating things for print and other physical media involves making permanent, tangible objects. There's a sense of finality when creating things for the physical world. That concept simply doesn't exist in the digital world, which means change can happen with much less effort and friction than other media. **Clients, colleagues, and stakeholders should embrace the pliable nature of the digital world to create living design systems that adapt to the ever shifting nature of the medium, user needs, and the needs of the business.** 

This shift in thinking fundamentally affects the scope of our work. Folks working in the client services business are often used to delivering a project in a tidy package then riding off into the sunset. Internal teams don't fair much better, since they tend to float from one initiative to the next. Whether you're part of an internal team or you're an external gun for hire, I'm guessing you've experienced the shortcomings of project-based work. We tend to talk about a future that never comes, and instead we set it, forget it, then move on to the next shiny project.

If we're committed to creating genuinely useful work that truly meets the needs of our clients and organizations, we must redefine the scope of our work. As Nathan Curtis says, a design system shouldn't be a *project* with a finite scope, but rather a *product* meant to grow and evolve over time:

> Focusing on style guide delivery as the climax is the wrong story to tell. A system isn’t a project with an end, it’s the origin story of a living and evolving product that’ll serve other products. <cite>[Nathan Curtis](https://medium.com/eightshapes-llc/a-design-system-isn-t-a-project-it-s-a-product-serving-products-74dcfffef935#.4umtnfxsx)</cite>

The web is never done, and the creation of a design system is merely the first step in a long (and hopefully fruitful!) journey. A design system should be a long-term commitment with the ambitious goal of revolutionizing how your organization creates digital work. Exciting, eh?! So how do we make sure that happens?

## Creating maintainable design systems
As you embark on this journey, let's talk about things you can do to craft a design system that sets up your organization for long-term success. How do you create a design system that takes root and becomes an essential part of your organization's workflow? What pitfalls do you need to be on the lookout for? How do you ensure the design system yields big results? To answer these questions, we need to:

- Make it official.
- Make it maintainable.
- Make it cross-disciplinary.
- Make it approachable.
- Make it public.
- Make it bigger.
- Make it agnostic.
- Make it contextual.
- Make it last.

<div class="editor">
{% capture m %} 
Ed: I wonder whether this list should be numbered. (I’ll leave it alone for now as it will impact matters below and you should choose what you prefer.) The rest of this chapter expands on each of these points, and some of these in turn contain further lists which are also then explained in more detail. It’s easy for a reader to lose track of where they are. If you decide to number this list, you can then add the corresponding number to the heading to help readers orient[ate] themselves.
{% endcapture %}
{{ m | markdownify }}
</div>

Let's go into each one of these points in more detail.

## Make it official
Your initial style guide may begin its life as a side project, the result of a weekend hackathon, or as the brainchild of one or two ambitious team members. As we discussed in the last chapter, your client or boss doesn't even have to know you're creating a thoughtful design system and accompanying pattern library. Remember: ask forgiveness, not permission!

Organic beginnings are all well and good, but to establish a truly <span class="editor">impactful</span> design system that creates long-term success for your organization, **the design system needs to evolve into an officially sanctioned endeavor**. That means thinking of it as a product rather than a simple side project, and allocating real time, budget, and people to it.

<div class="editor">
{% capture m %} 
Ed: While I’m not going to change ‘impactful’, it’s one of those relatively new (1960s) coinages that annoys some readers. More impressive, effective, cogent, potent or motivating alternatives are available. That said, in this context and with your readership, it’s unlikely to cause much consternation and it makes sense.
{% endcapture %}
{{ m | markdownify }}
</div>

Convincing stakeholders to commit large chunks of money, time, and resources up front for a design system can be extremely challenging. So what are we to do? Here's my advice:

1. Make a thing.
2. Show that it's useful.
3. Make it official.

<div class="editor">
{% capture m %} 
Ed: If the main list becomes numbered, then it’s probably best if this one uses something other than numbers, but still captures the sense of progress: lowercase roman numerals (i, ii, iii); or letters (a, b, c).
{% endcapture %}
{{ m | markdownify }}
</div>

Let's break down these steps a bit further.

### 1. Make a thing

<div class="editor">
{% capture m %} 
Ed: And obviously this subheading and the ones following should be updated to reflect the choice you make immediately above – but using uppercase versions as these mark subheadings: “I. Make a thing, II. Show that it’s useful”; “B. Show that it’s useful, C. Make it official”. Hope that’s clear.
{% endcapture %}
{{ m | markdownify }}
</div>

You have to start somewhere, and having something started is better than nothing at all. Pick a project that would be a great pilot for establishing your design system; follow a process similar to the one discussed in [chapter 4](/chapter-4/); think about the atomic design mental model detailed in [chapter 2](/chapter-2/); and you'll end up with a solid foundation for a thoughtful design system and pattern library that helps your team work more effectively. 

Take the time to package your UI patterns in a pattern library and get it ready to be shopped around. I've talked to several ambitious team members who have established the basic gist of their pattern library over the course of a weekend. This effort makes all the difference in the world since it provides something tangible for stakeholders to react to. Again: *show, don't tell*.

### 2. Show that it's useful 
With a nascent-yet-tangible design system in place, you can have a more meaningful conversation with the people who control money, scheduling, and resources. You can discuss exactly how the design system helped save time and money (see “[Pitching patterns](/chapter-4/#pitching-patterns)” in chapter 4), then paint a picture of how those benefits would scale even further if the organization invested in an official, robust design system. 

Get team members from different disciplines to back you up and discuss the initial success of the system, and also pull in others who are sympathetic to the cause who would stand to benefit from an expanded design system. 

### 3. Make it official
You've <span class="editor">prove<ins>d</ins><del>n</del></span> the value of your initial design system and presented a roadmap for how to make it even better. With any luck your organization will commit to making the design system an Official Thing. 

<div class="editor">
{% capture m %} 
Ed: The past tense of prove is proved, but proven has crept out of Scottish courtrooms (where ‘not proven’ is a verdict available alongside ‘guilty’ and ‘not guilty’) over the past three hundred years to become more widely used. I think your usage here harks back to an idiomatic use, ‘proven record’.
{% endcapture %}
{{ m | markdownify }}
</div>

With approval from the highest levels, you're now able to put a plan into action that involves: allocating or hiring people to work on the design system, developing a plan to make the design system more comprehensive, establishing a governance strategy, and laying out a product roadmap for the design system.

It's worth pointing out that things may not shake out the way you hoped. Despite demonstrating real value and presenting a concrete plan of action, higher-ups still might shoot your initiative down. **Don't be discouraged.** You may have lost the battle, but you can certainly win the war. Your team should continue to grow and extend the design system in whatever capacity you can until its value becomes undeniable. As more people benefit from the system, you'll have a groundswell of support to help push the endeavor through.

### Establishing a design system team

With the design system initiative approved, it's now time to put the right people and processes in place to ensure the system flourishes for your organization.

#### Design system makers and users
First things first. It's important to recognize that **there will inevitably be people at the organization who help <em>make and maintain</em> the design system, and there will be other people who will be <em>users</em> of the design system**. These two groups may not be mutually exclusive, but establishing the roles of makers and users is important.

When I talk about establishing a more collaborative process like the one I detailed in the previous chapter, I inevitably hear people who work at large organizations say, "But Brad, we have hundreds (or even thousands) of developers working on our products. Getting all those people to collaborate and contribute like that would be far too difficult."

They're likely right. It would be ideal if the entire organization adopted nimbler, more collaborative processes, but the daunting logistics around such an effort makes it improbable. Not everyone in the organization needs to contribute directly to the design system, but someone (or more likely, some people) must take ownership of it.

**The design system <em>makers</em> are the ones who <span class="editor">architect</span>, create, and maintain the system**, and they need to work closely together to ensure that the system is smart, flexible, scalable, and addresses the needs of the users and business. **The design system <em>users</em> are the teams across the organization who will take the system and employ its interface patterns to specific applications.** 

<div class="editor">
{% capture m %} 
Ed: ‘Architect’ as a verb. Bleurgh. Not wrong, exactly, but clumsy. Can you hear it? It doesn’t sound good. Alternatives: configure, construct, assemble, organize, formulate.
{% endcapture %}
{{ m | markdownify }}
</div>

{% include figure.html src="../images/fpo.png" caption="Design system makers and users" %}

**The design system <em>makers</em> and design system <em>users</em> need to maintain a close working relationship** to ensure the patterns defined within the system serve the needs of the applications, and that all documentation is clear. **Makers provide a birds-eye view of the entire ecosystem the design system serves, while users provide an on-the-ground perspective focused on the applications of the system.** Both outlooks are critical to the success of the design system, which is why it's so important for makers and users to have a healthy relationship that involves frequent communication and collaboration. 

<div class="editor">
{% capture m %} 
Ed: There’s a lot of bold and even emphasis within bold in the section above; indeed, in this whole chapter. Chances are, you don’t need to try so hard – it’s a typographic hammer to crack a semantic nut. You make your points effectively and eloquently enough without having to jab the reader in the eye. I’ve left it all in, however, as you may feel the points are important enough to warrant it. Up to you.
{% endcapture %}
{{ m | markdownify }}
</div>


#### <del>Who are the d</del>Design system makers<del>?</del>

<div class="editor">
{% capture m %} 
Ed: I’m not a fan of questions as headings. You can convey what's required in fewer words by what some people call front-loading; that is, remove the question signals (in this case, “Who are the”) that get in the way, and move the relevant content to the front of the heading. Boom. This is particularly effective here as you begin the following paragraph with more questions.
{% endcapture %}
{{ m | markdownify }}
</div>

Who updates the design system? Who approves changes? Who <span class="editor">interfaces</span> with the users of the design system to make sure it's addressing their needs? Who gets to decide which patterns stay, go, or need to be tweaked? 

<div class="editor">
{% capture m %} 
Ed: First ‘architect’ as a verb and now ‘interfaces’, which is beyond ugly. What’s wrong with ‘talks’?
{% endcapture %}
{{ m | markdownify }}
</div>


The answers to these questions will very much depend on the size and setup of your organization.

<div class="editor">
{% capture m %} 
Ed: OK, so here I did remove the emphasis. You’ve already set this sentence apart to draw attention to it. There’s really no need to impress the thought even deeper into the reader’s eyes.
{% endcapture %}
{{ m | markdownify }}
</div>

**Large organizations** <span class="editor">are able to dedicate serious resources to managing design systems.</span> Salesforce, for example, maintains an official *design systems team*, which currently includes about a dozen full-time employees, last I heard. That dedicated team is responsible for governing the design system and making sure it's meeting the needs of the <span class="editor">myriad</span> internal product teams, as well as external developers who build things on the company's platform. When a design system is serving thousands of users, it's a smart idea to dedicate at least a few full-time employees to manage and expand the system.

<div class="editor">
{% capture m %} 
Ed: I’ve interpolated a new sentence to allow the Salesforce example to stand clear of your thought about large organizations.
{% endcapture %}
{{ m | markdownify }}
</div>

<div class="editor">
{% capture m %} 
Myriad? We’ve been here before. Here, you could even just delete it.
{% endcapture %}
{{ m | markdownify }}
</div>

{% include figure.html src="../images/fpo.png" caption="Large organization diagram" %}

**Smaller organizations** most likely don't have the luxury of building an entire team to service a design system. Team members in smaller organizations have to wear many (hopefully stylish!) hats out of necessity, so governing the design system will likely become another responsibility. This may sound like an added burden ("Oh great, yet another thing I'm responsible for that doesn't involve a pay raise!"), but this particular hat should be a joy to wear as it improves the efficiency and quality of all other work. Hooray for design systems! 

Typically, design system makers at smaller organizations will be senior-level staff who have the experience and authority necessary to make thoughtful decisions and also enforce the design system.

{% include figure.html src="../images/fpo.png" caption="Small organization diagram" %}

And then there are **external agencies, contractors, and consultants**. What is the role of a <span class="editor">third party</span> when it comes to long-term maintenance of a client's design system? On one hand, external agencies are at a bit of a disadvantage, since they don't actually work for the client's organization. A successful design system needs to become part of an organization's DNA, and since third parties exist outside the company's walls, their influence is intrinsically limited.

<div class="editor">
{% capture m %} 
Ed: In these two paragraphs, I’ve changed a few instances of ‘external parties’ to ‘third parties’, which is a more usual way of referring to them, and it provides a little variation.
{% endcapture %}
{{ m | markdownify }}
</div>

But on the other hand, **external parties can often provide a sense of perspective** that's hard to see while working inside a company. This is where outsiders can really shine. In my work as a consultant, I work with organizations to establish long-term design system maintenance strategies and help get the right people and processes in place. While the long-term success of the system will ultimately be up to the organization, third parties can teach them to fish and provide important strategic guidance, feedback, and perspective. 

{% include figure.html src="../images/fpo.png" caption="Third-party diagram" %}

#### Design system users
<div class="editor">
{% capture m %} 
Ed: Again with the question for a heading. See above.
{% endcapture %}
{{ m | markdownify }}
</div>

Who are the people responsible for using the design system to build new features and applications? Who are the people who communicate with the system makers to report issues and request features?

Once again, the answers to these questions will largely depend on your organization's size and structure.

**Design system users may be the same team creating the design system, separate development teams within your organization, junior-level designers and developers, third-party agencies, offshore developers, or other external development teams.** 

<div class="editor">
{% capture m %} 
Ed: A whole one-sentence paragraph in bold? It doesn’t have to be.
{% endcapture %}
{{ m | markdownify }}
</div>

Users' proximity to and involvement in the creation of the design system will undoubtedly vary. You might work on a singular product at a scrappy <span class="editor">startup</span>, so your small team could be simultaneously creating and using the design system. Or you may work at a large multinational corporation with development teams and third-party partners scattered all across the globe. If this is the case, design system makers and users may seldom (if ever) meet, which means that helpful documentation and a sharp birds-eye perspective become that much more important. 

<div class="editor">
{% capture m %} 
Ed: Just flagging up ‘startup’ to make sure we’re consistent with (non)hyphenation.
{% endcapture %}
{{ m | markdownify }}
</div>

{% include figure.html src="../images/fpo.png" caption="Spectrum of design system users" %}

One of the biggest advantages of establishing a thoughtful design system is that it allows organizations to scale best practices. If all those best practices — responsiveness, accessibility, performance, UX, ergonomics, and so on — are baked into the system's UI patterns, users can simply plug in the patterns and reap the rewards. This means design system users don't have to be senior-level designers or developers to produce good work: the design system serves as a quality control vehicle that helps users apply best practices regardless of each person's skill level.

### Design system team makeup
**A cross-disciplinary team should be established to properly manage, maintain, and extend the system**. All disciplines at an organization — UX designers, visual designers, content strategists, front-end developers, back-end developers, product managers, project managers, executives, and other stakeholders — have unique perspectives that can undoubtedly inform and shape the work. Incorporating these perspectives into the design system is important, but doesn't necessarily require every discipline to be constantly involved in developing it.

There will inevitably be disciplines that actively do the work, while others may take on more of an advisory role. Those responsible for designing and building the user interface — UX designers, visual designers, front-end developers — will likely serve as the hands that do the work and make updates to the design system. They should work collaboratively (as detailed in chapter 4) and coordinate with the other disciplines to ensure that the system reflects the values and considerations of the entire business.

Other people may not be the ones actively doing the work, but must be consulted to make sure their perspectives are properly reflected in the system. Back-end engineers need to make the team aware of any architectural decisions that would affect the front-end UI; executives need to make the team aware of important initiatives that will affect the role and utility of the system; and, of course, design system users need to coordinate with the makers to ensure the system serves the needs of individual applications. 

{% include figure.html src="../images/fpo.png" caption="Design system team makeup" %}

<div class="editor">
{% capture m %} 
Ed: This has been a very long section, illustrating only the first point in the nine-point list set out earlier. I’d almost forgotten what I was reading was an expansion of a list item. The remaining sections are much shorter. I wonder, then, if the first list should indicate a couple of the subsections:

- Make it official.
  * Establishing a design system team
  * Design system team makeup
- Make it maintainable.
- etc.

However, this does make that original list a little less punchy. More thought required. Hmmn.
{% endcapture %}
{{ m | markdownify }}
</div>

## Make it maintainable
Many pattern libraries fall into a state of disrepair because the effort required to update patterns and documentation is far too high. If a pattern library is difficult and time-consuming to update, people will eventually stop maintaining it and the pattern library will begin its drift into oblivion. Making updates to UI patterns and documentation should be as frictionless as possible, so smoothing the process should become a high priority for the design system team. This involves careful consideration from both technological and workflow standpoints.

### In search of the <span class="editor">holy grail</span>
<div class="editor">
{% capture m %} 
Ed: I'm capping down holy grail here. This is neither Christian myth, Arthurian legend nor the adventures of Indiana Jones. You'd have an Easter egg at Easter, but hide easter eggs in software; so Christ's cup is the Holy Grail, but all other rare and perfect goals are holy grails. And while it makes for a catchy heading, in the content I'd consider ditching the metaphor altogether. Its repetition in the material below draws too much attention and does your theme a disservice. Perhaps you could consider using words like “ideal”, “perfect”, “model”, etc., depending on context. I’ll leave the grails in for now until such time as you decide to change them.
{% endcapture %}
{{ m | markdownify }}
</div>

**The design system holy grail involves creating an environment where the pattern library and production environment are perfectly in sync.** The idea is that you should be able to make a change to a UI pattern and see that change automatically reflected in the pattern library *and* anywhere the pattern is included in production. 

{% include figure.html src="../images/content/workflow-system-first-holy-grail.png" caption="The Holy Grail of design systems is one where one can make a change to a UI pattern and have it simultaneously update the pattern library and production environments." %}

The Holy Grail removes any duplication of effort and ensures the pattern library and the applications using the patterns remain synchronized. Sounds like a dream, right?

As it turns out, this dream can be a reality. Lonely Planet, the travel guide company, established a Holy Grail-style design system they call [Rizzo](http://rizzo.lonelyplanet.com/). They created an API for their UI patterns that feeds into both their production environments as well as their pattern library. The result is a centralized design system that ensures their live application and documentation remains perfectly in sync with one another.

{% include figure.html src="../images/content/rizzo.png" caption="Lonely Planet created an API for their UI patterns that is consumed by both their pattern library and production environment. By architecting their design system in this manner, changes to UI patterns are automatically reflected in both the pattern library and production environment, keeping things in sync and thereby achieving the Holy Grail." %}

Achieving the design system Holy Grail is no easy task, as it requires sophisticated technical architecture and smart people to set it all up. How you go about chasing the Holy Grail — or even if you can achieve it — is dependent on a whole load of factors, including your technical architecture and organizational makeup.

-------

In my experience, I've found that sharing CSS and JS with the production environment is relatively easy, but sharing markup is tough. 

- In 
- Using HTML templating languages create Templating language should match the production environment - The closer you get to . 
- Look for opportunities to automate documentation 
- [Using Grunt with Pattern Lab](http://bradfrost.com/blog/post/using-grunt-with-pattern-lab/)

How can you set up your applications and pattern library to achieve the Holy Grail? Developer Marcelo Somers outlined several methods for thoughtfully keeping your pattern library and production environments in sync. [Chasing the holy grail](https://medium.com/@marcelosomers/chasing-the-holy-grail-bbc0b7cce365#.vy45rkm7m)

There are a number of reasons why an organization may not be able to achieve the Holy Grail. Perhaps your organization has digital products on different platforms using wildly different technologies. For instance, the U.S. Web Digital Standards are a collection UI components and visual styles for websites. However, due to the decentralized nature of the , it would be impossible to 

When technology can't achieve maintainable design systems, you must rely on creating a culture that communicates change and enforces that friction 

## Make it cross-disciplinary
Style guides often jump straight into code snippets and pattern usage for the benefit of the design system users. Of course a pattern library needs to be helpful for the people actually making use of the patterns, but **treating a style guide solely a developer resource limits its potential**.

**A style guide has the opportunity to serve as a watering hole for the entire organization**, helping establish a common vocabulary for every discipline invested in the success of the company's digital products. Establishing this common vocabulary can lead to more efficient work, better communication, and more collaboration between disciplines across the organization. That's why the style guide should be an inviting place for everybody, not just design system users.

Take the carousel (please!). This component is amazingly complex from an organizational standpoint. A homepage carousel on an e-commerce website requires input from a myriad of disciplines across the organization. Business owners and editorial staff must choose products to be featured in the carousel. Copywriters must ensure the copy is effective and stays within the constraints of the design. Art directors must ensure the aesthetic design is pleasing and the product photography is legible across every screen size. UX designers need to ensure the functionality and controls are intuitive. Front-end people need to make sure the component is responsive, accessible, and performant. Backend developers need to make sure the component is properly wired up to the backend system. You get the idea. 

{% include figure.html src="../images/fpo.png" caption="Walmart carousel example" %}

A well-crafted style guide can help manage all these moving parts and ensure the many perspectives that influence each pattern are properly documented in the style guide. Make the pattern library accessible to every discipline, and think about how to make it easy and inviting for different disciplines to contribute to the documentation. 

## Make it approachable
This should come as a surprise to no one, but people tend to gravitate towards attractive things. A big part of making a style guide a cross-disciplinary resource is ensuring the container that houses your pattern library and other documentation is good-looking, inviting, and easy to navigate.

{% include figure.html src="../images/fpo.png" caption="Yelp's style guide has an attractive, friendly front page that explains what the resource is, who it's for, and how to use it." %}

Taking the time to craft an attractive home for your style guide and documentation can lead to more usage, help build awareness,    help create organizational investment, and help get non-developers' eyeballs on the style guide. All of this contributes to that important shared vocabulary that leads to better cross-disciplinary collaboration.

But creating a great-looking, intuitive style guide experience doesn't just happen, and this can be problematic when getting a style guide off the ground. If teams think that making a useful style guide involves making some Big, Official Thing with custom branding and a glossy website, they might be deterred from ever starting the initiative. So remember: 

1. Make a thing. 
2. Show that it's useful. 
3. Make it official. 

Creating a useful design system should be the team's first priority. A happy home to contain it all might not happen right out of the gate, but should become a bigger priority once the design system becomes official. Making a good-looking style guide isn't just design for design's sake; **it reflects an organization’s commitment to making and maintaining a thoughtful, deliberate design system**.

## Make it public
Another way to set your design system up for long-term success is to **make your style guide publicly accessible**.

But why? After all, isn't a style guide merely an internal resource to help your organization work better together? What use is it to the outside world? And wouldn't publishing your style guide give away all your trade secrets?

**Publishing your style guide for the world to see increases its visibility, increases accountability, and serves as an amazing recruitment tool**.

Putting your style guide behind a login or firewall reduces visibility and adds an unnecessary burden for your team and partners, which limits the resource's effectiveness and potential. And the fears about giving away your trade secrets are completely unfounded. These are UI patterns, not nuclear codes.

{% include figure.html src="../images/fpo.png" caption="Stlyeguides.io rounds up over 150 public-facing style guides from organizations across the world." %}

In addition to making important documentation easier to access, a public style guide **helps create organizational accountability**. Publishing your style guide demonstrates your organization's commitment to the design system, which creates a helpful bit of pressure to keep it an up-to-date and useful resource. 

Public-facing style guides are also **hugely helpful for recruiting efforts**. Designers, developers, and other disciplines are looking to work at organizations that embrace modern digital best practices, and (as we've discussed throughout this book) design systems are quickly becoming an industry-wide best practice. Publishing your style guide sends out a strong bat signal that can attract passionate, pattern-minded people. For instance, style guide expert Jina Bolton went to work at Salesforce after seeing the company's style guide for their Salesforce1 product. 

> When I saw Salesforce’s style guide I thought it was beautiful and it's why I wanted to join this team. <cite><a href="http://styleguides.io/podcast/jina-bolton">Jina Bolton</a>

Since joining Salesforce, she's helped create the ultra-successful Lightning Design System and helps manage their growing design system team. Jina's story is not an isolated one; almost every guest Anna Debenham and I interviewed on the Styleguides Podcast(http://styleguides.io/podcast) discussed how helpful their public-facing pattern library was for attracting talent. All that means that your a public style guide makes your organization *more* competitive, not less.

## Make it bigger
A visible, cross-disciplinary, approachable pattern library is one that your team will frequently reference. Use that to your advantage. Since the team's eyeballs are already fixated on that one resource, there's a big opportunity to extend it to include other helpful documentation like the voice and tone, brand, code, design principles and writing guidelines we discussed in chapter 1. 

{% include figure.html src="../images/content/styleguide-harmony.png" caption="Intuit's Harmony design system includes a pattern library, design principles, voice and tone, marketing guidelines, and more. Housing this helpful documentation under one roof helps increase its visibility." %}

Now, your organization may not necessitate every flavor of style guide out there, but the point is that **creating a centralized style guide hub builds more awareness of best practices, increasing the documentations' effectiveness**.

{% include figure.html src="../images/content/styleguide-harmony-2.png" caption="Intuit's Harmony pattern library includes tabs to switch between web, iOS, and Android for each pattern. This allows the team to maintain a mostly consistent design system across platforms but also document pattern divergences when they occur." %}

## Make it agnostic
The way your UI patterns are named will undoubtedly shape how they are used. **The more agnostic pattern names are, the more versatile and reusable they become**.

Because we establish UI patterns in the context of a broader page, it can be tempting to name components based on where they live. But rather than naming your component "homepage carousel" (forgive my morbid obsession with carousels), you can simply call it "carousel" instead, which means you can now put carousels everywhere! (But for the love of all that is holy, please don't.)

Another challenge for naming *display* patterns is that we tend to get distracted by the *content* patterns that live inside them. For instance, if working on an e-commerce site, you may be tempted to call a block containing a product image and title a "product card." But naming things in this manner immediately limits what type of content can live inside it. By naming the pattern simply "card," now you can put all sorts of content patterns inside it: products, promotions, store locations, etc.

Fair warning: **naming things is really freaking hard**. But there are strategies to help you create sound names for your patterns. Conducting an interface inventory (as detailed in [chapter 4](/chapter-4/#show-dont-tell-the-power-of-interface-inventories)) helps remove patterns from the context of the page where they normally reside, meaning your team can create names that aren't distracted by their context. And I've conducted naming exercises with teams where we've blurred out the content residing inside a pattern so everyone can focus on the pattern's *structure* rather than the *content* that lives inside it.

{% include figure.html src="../images/content/modal-blur.png" caption="When naming patterns, try blurring out their content so that your names reflect the patterns' structure rather than the content  that lives inside them." %}

While naming things will always be a challenge, pattern names that are agnostic to context and content will be more portable, reusable, and versatile.

## Make it contextual
Showcasing UI patterns in a pattern library is all well and good, but **you need to demonstrate context in order for design system users to understand how and where to properly use them**. Most pattern libraries show a demo of each UI pattern, but as we've discussed throughout this book, those patterns don't live in a vacuum. Where exactly are these patterns utilized?

One way to demonstrate context might include showing screenshots or videos of a component in action. Material Design's documentation does a fantastic job at this; each component is rich with photos, videos, and usage details to give their users a clear understanding of what these patterns look like in the context of an application and demonstrate how each pattern should be used.

{% include figure.html src="../images/content/material-design-bottom-nav.png" caption="Material Design's component library doesn't just contain an example of each component; it thoroughly documents the component's usage with plenty of images and video to support it." %}

Another way to show context is to provide lineage information for each pattern. As we discussed in Chapter 3, tools like Pattern Lab automatically generate this information which lets you to see which patterns make up any given component, and also show where each component is employed. This provides a sort of pattern paper trail that helps immensely with QA efforts, as it highlights exactly which patterns and templates would need tested if changes were made to a particular pattern.

{% include figure.html src="../images/content/pattern-lab-lineage.png" caption="Tools like Pattern Lab allow teams to see which smaller components make up any given component, as well as where each pattern gets used." %} 

## Make it last

Making a design system is an incredibly and important endeavor. But without proper maintenance, the value of your design system will deprecate much like a car that's just been driven off the dealer's lot. Instead, your design system should be like a bottle of fine wine that increases value over time.

{% include figure.html src="../images/fpo.png" caption="Used car and bottle of wine" %}

### Managing change 
Change is the only constant, as they say. A successful design system is able to roll with the punches, adapt to feedback, be iterated upon, and evolve alongside the products the system serves. The *living* part of a living design system means that it needs to grow and evolve over time.

**Creating a clear governance plan is essential to make sure your design system will continue to**. Without a clear governance strategy in place, the value your design system may deprecate much like a car that's just been driven off the lot. Instead, your design system should be like a fine wine that increases value over time.

What does a successful 
- Schedule regular reviews of the patterns. 
- Have a plan Deprecate patterns https://github.com/salesforce-ux/sass-deprecate

Making a design system last means consistently . It needs to be visible and stay in the front of everyone's minds. 

### Communicating change
You can create the best style guide in world, use the most appropriate technology, have an amazing team in place, and have excited users, but if you don't communicate updates and changes to the design system the entire effort will suffer.

**It's essential to establish a comprehensive communication strategy** so that makers, users, and other stakeholders are well aware of  all the latest changes to and thinking around the design system. This is especially important in the early days of the initiative. Frequent communication helps keep the design system in the front of everyone's mind so it takes root and becomes an integral part of your organization's workflow. 

**As time goes on, frequent communication helps the system increase in value like that fine bottle of wine**. Communication can include: 

- Change logs ("Here's what's changed in the pattern library this month")
- Roadmaps ("Here's what's coming up over the next few months")
- requests for feedback ("We're considering deprecating our carousel pattern and would like to hear what you think."),
- Surveys ("On a scale from 1-5, how useful is the pattern documentation?")
- Success stories ("Team X launched this new feature using the design system; read more about how they did it.")
- Resources ("Here's a great article about documenting ")

**Design system changes, updates, and requests should be communicated wherever your team hangs out**. That may include Slack, BaseCamp, Github, wikis, Yammer, email lists, company blogs, intranets, and any other internal tools your team uses to communicate and collaborate. 

- Publish updates (Material Design example)
- Notifications - Regular E-mail newsletters, blog updates, etc, whenever things change, Slack integrations, 
- email updates, blog posts, video casts, 

> Whenever someone makes a pull request, it sends a notification to our #Design slack channel, announcing to the team that there is a proposal change and feedback is required <cite><a href="https://medium.com/shyp-design/managing-style-guides-at-shyp-c217116c8126">Micah Sivitz, Shyp</a> 

- Monitor progress over time - Lonely Planet's Rizzo design system tracks performance metrics over time.

## Go forth and be atomic

