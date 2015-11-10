---
layout: page
title: The Atomic Workflow
chapterTitle: Chapter 4
permalink: /chapter-4/
---

Talk is cheap. And up until now, we've been doing a whole lotta talkin'. That's not to say it hasn't been productive talk! After all, we've discussed the importance of modular thinking, we've learned a methodology for crafting deliberate UI design systems, and we've showcased tools for creating effective pattern libraries. 

But here's where the rubber meets the road. Where we roll up our sleeves and put all of this theory into practice. Where we *get stuff done*. This chapter will tackle all that goes into selling, creating, and maintaining effective design systems. You ready? Let's go.

## It's People!
The not-so-secret secret about creating effective design systems (or doing any great work, really): **it all comes down to people truly collaborating and communicating with each other**.

If this is such common knowledge, then why aren't we constantly hearing about thousands of success stories from around the world? I'll let Mark Boulton explain:

> The design process is weird and complicated, because _people_ are weird and complicated. <cite>Mark Boulton</cite>

You can have all the right technologies in place, use the latest-and-greatest tools, and even have extraordinarily talented individuals on board, but if everyone involved isn't actually cooperating and communicating with each other then you're not going to create great work. It's as simple as that. That's not to say you can't create *good* work, but more often than not you're going to create *one of the many disappointing shades of bad* work.

This chapter will discuss how to overcome human beings' many quirks to come together as an organization to make and maintain successful interface design systems. 

## Pitching patterns
In order to get stakeholders and clients on board with establishing a pattern-based organization, we must change their existing behavior. That involves constant education, as well as a bit of marketing savvy.

**Extol the virtues of establishing interface design systems**. By this point in the book you've hopefully become familiar with the benefits of interface patterns, so you'll be able to rattle off the benefits of pattern libraries to your clients and colleagues:

- They **promote consistency and cohesion** across the entire experience.
- They **speed up your team's workflow**, saving time and money.
- They **establish a more collaborative workflow** between all disciplines involved in a project.
- They **establish a shared vocabulary** between everyone in an organization, including outside vendors.
- They **provide helpful documentation** to help educate stakeholders, colleagues, and even third parties.
- They **make cross-browser/device, performance, and accessibility testing easier**.
- They **serve as a future-friendly foundation** for teams to modify, extend, and improve upon over time.

What I've found is that I can talk aboutAnswer a simple question "Do you like saving time and money, yes or no?" 


### When to establish a pattern library
Interface design systems and their accompanying pattern libraries are often done in conjunction with a new design or redesign project, replatforming effort, some other project. Piggybacking off another effort is a great way to sneak a pattern library project into your organization.

But establishing a pattern library doesn't necessarily need to be attached to another project. If you can convince your clients and bosses to pony up the cash and resources to make things happen, then good on you! 

- In-house vs client work

### Show, Don't tell
- Even if they say no, do it anyways. Much like building in performance and accessibility and responsiveness into our experiences

- In addition to gathering user research, competitive research, business requirements, etc, can start laying the foundation for the future pattern library.
- conducting an interface inventory

### Conducting an interface inventory
Many are familiar with the concept of a [content inventory](https://en.wikipedia.org/wiki/Content_inventory). Content audits are usually performed in the early stages of a website redesign process to take stock of all a site’s content. It’s a tedious process involving spreadsheets and caffeine, but the hard work pays off. You end up all your content laid out on the table, which gives you a new perspective on what your content is and how to tackle it.

Enter the interface inventory.

An interface inventory is similar to a content inventory, only instead of sifting through and categorizing content, you’re taking stock and categorizing the components making up your website, app, intranet, hoobadyboop, or whatever (it doesn’t matter). An interface inventory is a comprehensive collection of the bits and pieces that make up your interface.

Conducting an Interface Audit
Here are the steps to creating an interface inventory:

1. Crack open your project. Get your screenshot fingers ready.
2. Set up a blank template where you’ll dump and categorize the components of the interface. I’d recommend using a program like Keynote or PowerPoint, as you really just need a category title and a place to dump screenshots. I’ve created an interface inventory Keynote template with a bunch of categories to get you started.
3. Start screenshotting. Now for the fun/tedious part. Start grabbing screenshots of the ingredients of your interface. Grab headings, text fields, radio buttons, carousels, accordions, tabs, images, icons, video players, graphs, etc, etc. Note that you’re not trying to capture every single instance of a component, but rather uncover distinct treatments of a component (like a button with a bevel and right-facing caret vs another without any bevel/caret).
4. Categorize screenshots. You can do this as you go or after your screenshotting session, but the goal is to be able to view all the various treatments of a particular molecule side by side.
5. Present the interface inventory to your boss/client/organization and watch them cry realistic tears.

### Benefits of an Interface Inventory
Why go through all the trouble of deconstructing and cataloging an interface? It’s certainly a tedious process, but the results are extremely beneficial. Here are just some of the benefits of an interface inventory:

- **Lays the groundwork to a sound design system**—Creating systematic, atomic, styleguide-driven design is a smart strategy, and an interface inventory is that first step at deconstructing pages down to their atomic level. Eventually the interface inventory can be used to help set up a style guide or pattern library.
- **Convince your boss/client/organization** that establishing a cohesive design system is essential. This is especially true for large organizations consisting of many teams or working with multiple 3rd party agencies. An interface inventory is the first step toward establishing a common interface language.
- **Promote consistency**—Displaying a plethora of similar-but-still-different treatments next to each other exposes redundancy and underscores the need to create a consistent, cohesive experience.
- **Ensures all interface components are accounted for**—This happens a lot. A full-on redesign is underway, and somewhere along the line certain modules end up slipping between the cracks. Creating an interface inventory up front helps establish project scope and ensures that all components are accounted for so there are no nasty surprises at the 11th hour before launch.
- **Responsive Retrofitting**—While mobile-first responsive design is certainly a preferred approach to responsive design, it’s not always feasible to undertake right away. Budget, time, scope, skillset, and more often force organizations to retrofit their existing website into a responsive site. Creating an interface inventory allows design teams to analyze the interface in order to establish what components will be easy and relatively difficult to convert into a responsive environment.

#### Interface Inventories In Action
I went through just a few pages of my bank’s website and screen grabbed all the various button variations I could find. Here’s the result:

{% include figure.html src="../images/content/pattern-lab-code.png" caption="" %}

As you can see, their button styles are all over the place and are about the furthest thing from consistent and cohesive. Looking closer at the buttons reveal incredible inconsistency in gradient, arrow, border and more:

{% include figure.html src="../images/content/pattern-lab-code.png" caption="" %}

Now contrast these styles with a button interface inventory for Etsy, a company who maintains a robust styleguide and pattern library:

Various button styles for Etsy.com
As you can see, there are far fewer button styles. This is a good thing as it means that there are only a few button styles that get reused throughout the interface.

It’s not to say that deviating from established patterns is always a bad idea, but it’s important to recognize the difference between intentional and unintentional deviation. An interface inventory helps expose unintentional inconsistencies and encourages consistent, deliberate design decisions.

The Road Ahead
More organizations are beginning to understand the need to create robust design systems, and interface inventories can be a great way to display an interface as a system of components rather than a series of discrete pages. An interface inventory can be a great way to convince your client/boss/organization to undertake a thoughtful, systematic redesign.

Download the interface inventory Keynote boilerplate and get screenshotting!

In order to present your product or service in a cohesive and consistent manner across a slew of properties, browsers, devices, and environments, it’s essential to take stock of what your interface is composed of. Documenting unique UI patterns highlights inconsistencies and sets the stage for a broader conversation about establishing a pattern-based workflow.

So how do you go about conducting an interface inventory? What are the considerations to keep in mind? Here are the steps to conduct a successful interface inventory:

1. Round up the troops
2. Prepare for screenshotting
3. Screenshot exercise
4. Present findings
5. Regroup and establish next steps

#### Step 1: Round up the troops
At many workshops and consulting engagements, I’ve encountered folks who say something along the lines of “Oh yeah Sarah started doing an inventory of our UI.” While it’s great one member of the team is thinking systematically, it’s absolutely essential to get everyone in an organization to participate in the interface inventory exercise.

Gather a cross-disciplinary group of folks – designers, developers, project managers, business owners, QA, and really anyone that touches the experience – in a room together to conduct the interface inventory exercise together. After all, one of the most crucial results of this exercise is to establish a shared vocabulary for everyone in the organization, and that requires input from everyone.

#### Step 2: Prepare for screenshotting
This exercise requires generating a ton of screenshots, so naturally you’ll need screenshotting software. Ultimately, it doesn’t really matter what tool to use, but everyone involved in the exercise should agree on a tool to make it easier to combine at the end. A few options:

Keynote/Powerpoint
Photoshop/Sketch
Evernote web clipper
Google Docs
Google Slides
Lately I’ve found Google Slides to be my go-to recommendation for conducting interface inventories. It provides a canvas for freeform positioning of images, it’s chunked out into slides for better categorization, and it’s web-based so can be shared with ease. I’ve created a template for you to use if you’re interested.

#### Step 3: Screenshot exercise
And now for the main event, which is to document, name, and categorize unique UI patterns across the entire experience.

I typically break people up into pairs and assign them a UI category or categories, but this all depends on how many people are participating. I try to timebox the screenshotting exercise to avoid going down a rabbit hole that ends up lasting all day. The amount of time to allocate will vary depending on how many people are participating, but I find between 30-90 minutes to be sufficient for a first pass of the interface inventory.

So what categories of interface elements should be captured? Obviously the interface element categories are going to vary from experience to experience, but here’s a few categories to potentially start with:

- **Global** – things like headers and footers and other global elements that are shared across the entire UI
- **Navigation** – primary navigation, footer navigation, pagination, breadcrumbs, interactive component controls, and basically anything that’s used to navigate around a UI
- **Image types** –  Logos, heros, avatars, thumbnails, backgrounds, etc and any other unique image pattern that shows up in the UI. I’ve found this of the most challenging categories to round up.
- **Icons** – a special type of image worthy of its own category. Capture magnifying glasses, social icons, arrows, hamburgers, spinners, favicons, and every other interface icon across the experience
- **Forms** – Inputs, text areas, select menus, checkboxes, switches, radio buttons, sliders, and other forms of user input
- **Buttons** – The quintessential UI element. Capture all the unique button patterns throughout an experience: primary, secondary, big, small, disabled, active, loading, etc
Headings – h1, h2, h3, h4, h5, h6 and variations of typographic headings. This can be another challenging category as many elements might be considered headings
- “**Blocks**” – I call collections of headings and/or images and/or excerpts “blocks”.  These are relatively simple clusters of interface that are built for reuse (see Nicole Sullivan’s write-up about the Media Object)
- **Lists** –  Unordered, ordered, definition, bulleted, numbered, lined, striped, etc. Any collection of elements presented in a list-type format
- **Interactive Components** – Accordions, tabs, carousels, and other modules with moving parts
- **Media** – Video players, audio players and other rich media elements
- **3rd Party** – Widgets, iframes, stock tickers, social buttons,  even [invisible tracking scripts](http://bradfrost.com/blog/post/surfacing-invisible-elements/). anything that isn’t hosted on your domain
- **Advertising** – A special kind of 3rd party category which includes all ad formats and dimensions
- **Messaging** – Alerts, success, errors, warnings, errors, validation, in-progress, popups, tooltips, 4o4s, etc. This is a challenging category as these messages often require user action to expose, but it’s essential to get messaging right.
- **Colors** – Capture all unique colors presented in the interface. This category can be aided by fantastic tools like [CSS Stats](http://cssstats.com/) and [Stylify Me](http://stylifyme.com/)
- **Animation** – This is a special category as it involves capturing UI animation. This requires using screen recording software such as Quicktime to capture motion (you can capture screens in Quicktime with File > New Screen Recording).
Again, these categories aren’t set in stone and will vary based on the nature of the project. Once these patterns are documented the person (or pair of people) should drop them into  Google Slides and cluster them together. Now the fun part: naming these patterns. Obviously it’s important to use existing conventions wherever possible, but you’ll quickly find out many UI patterns either don’t have names or have conflicting/confusing names.

#### Step 4: Present Findings
Screenshotting and naming can be exhausting and overwhelming, so be sure to take a break after the gathering exercise is complete. Get some food, grab some coffee, and stretch your legs.

Once everyone’s recharged, reconvene and spend about 10-15 minutes per category presenting the findings to the group. This is where things get interesting. Presenting to the group allows the team to start discussing the naming conventions and rationale for these UI patterns.  As I do more of these exercises with teams, it’s fascinating to hear that designers, developers, and product owners often have different names for the same UI pattern.

Once every category has been presented and discussed, have all the participants send their slides to the exercise leader, who merges everything into one uber-document.

#### Step 5: Regroup and Establish Next Steps
The hard work is done, so now what? This exercise should be used as a conversation starter to get the entire organization on board with crafting an interface design system.

The uber-document can be shopped around to stakeholders to get buy in for establishing an interface design system. The beautiful thing about seeing all the disparities of an interface laid bare for everyone to see is that it becomes crystal clear something needs done about it.

In addition to selling the idea through, the interface inventory should be used as the groundwork for a future pattern library. Gather a smaller cross-disciplinary team together to go through the uber-document and have some conversations about it. Some important questions for this group to cover:

What names should we settle on?
What patterns should stay, and which should go?
Can we merge patterns together easily?
How do developers, designers, and managers begin to utilize this shared vocabulary?
How do we translate this exercise into a living pattern library?

## (Re)setting expectations
> As an industry, we sell websites like paintings. Instead, we should be selling beautiful and easy access to content, agnostic of device, screen size, or context. <cite>[Dan Mall](http://danielmall.com/articles/the-post-psd-era/)</cite>

- Death to the waterfall

{% include figure.html src="../images/content/pattern-lab-code.png" caption="" %}

- This involves everyone - UX designers, visual oriented designers, front-end developers, backend developers, business owners, clients, etc
- [Development is design](http://bradfrost.com/blog/post/development-is-design/)

## Establish Direction
> Ideas are meant to be ugly. <cite>[Jason Santa Maria](http://jasonsantamaria.com/articles/piles-of-ideas)</cite>

- Rather than leading off with high fidelity wireframes and comps, the design process
- [Style Tiles](http://styletil.es/) by Samantha Warren
- Front-end [prep chef](http://bradfrost.com/blog/post/primed-and-ready-to-go/)

## Roll up our sleeves
- [Element collages](http://danielmall.com/articles/rif-element-collages/)
- Going from rough wireframes into the browser, iterating there

## Maintaining a living design system
- And they made a pattern library and lived happily ever after. Right? Not quite.
- There's a very real risk of a lot of time and effort going into making a design system and accompanying pattern library, only to have it die on the vine.
- Throw the design system in the trashcan, right along side the PSDs, PDFs and other artifacts
- How to prevent this? 

### Make It Maintainable
- Don't let it die on the vine and become obsolete
- Sharing CSS and JS with the production environment is easy, but sharing templates is tough
- Templating language should match the production environment
- [Using Grunt with Pattern Lab](http://bradfrost.com/blog/post/using-grunt-with-pattern-lab/)

### The Holy Grail
- Holy Grail is when the pattern library and production environment are perfectly in sync. Make a change to a pattern library, and anywhere the pattern is included in production will be updated.
- [Rizzo](http://rizzo.lonelyplanet.com/) by Lonely Planet has accomplished this.

### Make it cross-disciplinary
- Not just a developer tool. Not just a designer tool. Every discipline invested in the success of the website should be contributing to the pattern library.
- Carousel component example - amazingly complex component requiring input from business owners, editorial staff, content strategists, art directors, UX designers, front-end people, backend people

### Make it Approachable
- No shocker here, but good design leads to more usage.
- Avoid exposing tons of code right out of the gate as it might discourage other disciplines from looking at it ("Oh this must not be for me")

### Make it visible
- Make it public. 
- Recruitment, recruitment, recruitment. 

### Make it Agnostic
- The more agnostic pattern names are, the more versatile and reusable they become. 
- Nicole Sullivan [media object](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/)

### Make it Contextual
- Demonstrate context. Where are 
- Pattern Lab lineage

### Make it last
- Publish updates (Material Design example)
- Regular E-mail newsletters, blog updates, etc, whenever things change
- Monitor progress - Lonely Planet performance 

## Go forth and be atomic

