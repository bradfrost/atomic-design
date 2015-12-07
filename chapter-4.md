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

If this is such common knowledge, why aren't we constantly hearing thousands of success stories from around the world? I'll let Mark Boulton explain:

> The design process is weird and complicated, because _people_ are weird and complicated. <cite>Mark Boulton</cite>

You can have all the right technologies in place, use the latest-and-greatest tools, and even have extraordinarily talented individuals on board, but if everyone involved isn't actually cooperating and communicating with each other then you're not going to create great work. It's as simple as that. That's not to say you can't create *good* work, but more often than not you're going to create *one of the many disappointing shades of bad* work.

Establishing and maintaining successful interface design systems is an organization-wide effort, and this chapter will discuss how to overcome human beings' many quirks to make them happen. 

## Pitching patterns
Introducing a new way of doing things is no easy task as it requires changing people's existing mentalities and behaviors. Getting stakeholders and clients on board with establishing a design system involves constant education, as well as a bit of marketing savvy. 

First things first. It's necessary to introduce the concept of interface design systems to your clients, colleagues, and stakeholders. Explain what these design systems are and the many ways they can help the organization. We've discussed these benefits throughout the book, so you can explain how design systems **promote consistency and cohesion**, **speed up your team's productivity**, **establish a more collaborative workflow**, **establish a shared vocabulary**, **provide helpful documentation**, **make testing easier**, and **serve as a future-friendly foundation**. Who can say no to all that!?

Alas, I've found that I can hype design systems until I'm blue in the face, but the suits don't always see things through the same lens as the people on the ground. A simple reframing of the question helps immensely. I've found it much more effective to simply ask, "**Do you like saving time and money, yes or no?**" If the answer to that question is *no*, I'm afraid you have way bigger problems than selling a design system. If the answer is *yes*, then you can pitch the benefits through the lens of time and money. Let's try this out, shall we?

- Design systems **lead to cohesive, consistent experiences**. That means users master your UI faster, leading to more conversions and **more money**.
- Design systems **speed up your team's workflow**. Rather than reinventing the wheel every time a new request comes down the pipe, teams can reuse already-established UI puzzle pieces to roll out new pages and features faster than ever before.
- Centralizing UI components in a pattern library **establishes a shared vocabulary** for everyone in the organization and **creates a more collaborative workflow** across all disciplines. With everyone speaking the same language, more time is spent getting work done and less time is spent dealing with superfluous back-and-forth communications and meetings.
- Design systems **make cross-browser/device, performance, and accessibility testing easier**, vastly speeding up production time and therefore allowing teams to launch more stuff faster. Also, baking things like accessibility into a living design system means less risk of getting sued for inaccessible features.
- Once a design system (with accompanying pattern library) is established, it **serves as a future-friendly foundation** for the organization to modify, tweak, extend, and improve upon over time. Doing some AB testing? Roll the learnings from those tests into the living design system! Made some big performance optimizations? Roll them into the living design system! The *living* part of living design systems means they can always adapt to meet the future needs of the organization, saving time and money all the while.

Framing things through the lens of time and money helps the people controlling the pursestrings understand why a design system is a worthwhile pursuit. With any luck, these conversations will translate to a concrete commitment from the organization (read: allocating real time and money) to make a design system happen.

## Show, don't tell: the power of interface inventories
If only getting buy-in were as easy as having a few well-timed conversations with the right people. Maybe you're savvy enough to seal the deal with talking points alone, but for us mere mortals words aren't enough. Sometimes you need to need more. Sometimes you need to make them *feel the pain*.

Enter the interface inventory.

Many are familiar with the concept of a [content inventory](https://en.wikipedia.org/wiki/Content_inventory). Content audits are usually performed in the early stages of a website redesign process to take stock of all a site’s content. It’s a tedious process involving spreadsheets and caffeine, but all that hard work pays off. By the end of the exercise the organization's content is laid out on the table, giving teams valuable insights for how to handle their content as they tackle their project.  

An interface inventory is similar to a content inventory, only instead of sifting through and categorizing content, you’re taking stock and categorizing the components making up your user interface. **An interface inventory is a comprehensive collection of the bits and pieces that make up your user interface**.

{% include figure.html src="../images/content/united-buttons.jpg" caption="Here's a collection of all the unique button styles found on the homepage of United.com. An interface inventory rounds up and categorizes all the unique patterns that make up an interface." %}

### Conducting an interface audit
So how do you go about conducting an interface audit? How do you go about rounding up all the components that make up your UI? The simple answer to those questions is *screenshots*. Lots of them! Creating an interface inventory requires screenshotting all the unique UI components that make up your user experience. While that's a relatively straightforward endeavor, there are some important considerations to keep in mind to make the inventory as fruitful as possible. Let's go through the process on how to create a successful interface inventory.

#### Step 1: round up the troops
I’ve encountered many ambitious designers or developers who have taken it upon themselves to start documenting their organization's UI patterns. While I certainly applaud this individual ambition, **it’s absolutely essential to get all members of the team to experience the pain of an inconsistent UI and start thinking systematically**.

In order for the interface inventory to be as effective as possible, **representatives from all disciplines responsible for the success of the site should be in a room together** for the exercise. Round up the troops: UX designers, visual designers, front-end developers, back-end developers, copywriters, content strategists, project managers, business owners, QA, and any other stakeholders. The more the merrier! After all, one of the most crucial results of this exercise is to establish a shared vocabulary for everyone in the organization, and that requires input from the entire team.

#### Step 2: prepare for screenshotting
The interface inventory exercise generates a ton of screenshots, so naturally you’ll need software to capture and display those screenshots, such as:

- Powerpoint or Keynote
- Photoshop or Sketch
- Evernote web clipper
- Google Docs or Microsoft Word
- Google Slides (If you're interested, I've created a [Google Slides interface inventory template](https://docs.google.com/presentation/d/1GqFmiDV_NqKi36fXAwD3WTJL5-JV-gHL7XVD2fVeL0M/edit?usp=sharing))

{% include figure.html src="../images/content/interface-inventory-template.png" caption="It's important for all participants to capture screenshots using the same software so they can be combined later. I've created a Google Slides interface inventory template for teams to use as a starting point." %}

Ultimately, it doesn’t really matter what tool you use, but everyone should agree on a single tool to make it easier to combine at the end of the exercise. I’ve found online slide-building software like Google Slides to be very effective as they provide a canvas for free-form image positioning, they're chunked out into slides for easier categorization, and they're web-based so can be shared with ease.

#### Step 3: screenshot exercise
Get your screenshotting fingers ready because it's time for the main event! **The interface inventory exercise involves screenshotting and categorizing all the unique UI patterns that make up your experience**. Bear in mind this exercise doesn't mean capturing *every instance* of a particular UI pattern, but rather capturing *one instance of each* unique UI pattern.

Assign each participant a UI category. You may need to break people up into pairs or have participants document multiple categories, depending on how many people are participating in the exercise. Again, the more the merrier, as more people screenshotting will result in more thorough documentation.

##### What patterns to capture
So what categories of interface elements should be captured? Obviously the interface element categories are going to vary from interface to interface, but here’s a few categories to start with:

- **Global elements** – components like headers, footers, and other global elements that are shared across the entire experience
- **Navigation** – primary navigation, footer navigation, pagination, breadcrumbs, interactive component controls, and essentially anything that’s used to navigate around a user interface
- **Image types** – Logos, hero images, avatars, thumbnails, backgrounds, etc and any other type of image pattern that shows up in the UI
- **Icons** – Icons are a special type of image worthy of their own category. Capture magnifying glasses, social icons, arrows, hamburgers, spinners, favicons, and every other interface icon.
- **Forms** – Inputs, text areas, select menus, checkboxes, switches, radio buttons, sliders, and other forms of user input
- **Buttons** – Buttons are the quintessential UI element. Capture all the unique button patterns found throughout the experience: primary, secondary, big, small, disabled, active, loading, and even buttons that look like text links.
- **Headings** – h1, h2, h3, h4, h5, h6 and variations of typographic headings
- "**Blocks**" – Also known as touts, callouts, summaries, ads, or hero units, "blocks" are collections of typographic headings and/or images and/or summary text (see Nicole Sullivan’s write-up about the [Media Object](http://www.stubbornella.org/content/2010/06/25/the-media-object-saves-hundreds-of-lines-of-code/) as an example of a block).
- **Lists** – unordered, ordered, definition, bulleted, numbered, lined, striped, or any group of elements presented in a list-type format
- **Interactive Components** – Components in the truest sense, accordions, tabs, carousels, and other modules with moving parts are crucial to capture.
- **Media** – video players, audio players and other rich media elements
- **3rd Party Components** – widgets, iframes, stock tickers, social buttons, [invisible tracking scripts](http://bradfrost.com/blog/post/surfacing-invisible-elements/), and anything else that isn’t hosted on your domain
- **Advertising** – all ad formats and dimensions
- **Messaging** – alerts, success, errors, warnings, validation, loaders, popups, tooltips, etc. This can be a challenging category to capture as messaging often requires user action to expose.
- **Colors** – Capture all unique colors presented in the interface. This category can be aided by fantastic style-guide bootstrapping tools like [CSS Stats](http://cssstats.com/) and [Stylify Me](http://stylifyme.com/).
- **Animation** – Animation is an elemental aspect of user interfaces, and should therefore be documented. This requires using screen recording software such as Quicktime to capture any UI element that moves, fades, shakes, transitions, or shimmies across the screen.

{% include figure.html src="../images/content/pnc-forms.png" caption="An example of various form elements captured in an interface inventory for a major bank's website" %}

{% include figure.html src="../images/content/pnc-buttons.png" caption="An example of unique button patterns captured in an interface inventory for a major bank's website" %}

Again, these categories aren’t set in stone and will vary based on the nature of the type of user interface you're dealing with. Of course it's important to add, subtract, or modify these categories to best fit your organizational needs.

##### Timing is everything
Try to set time limits on the screenshotting exercise to avoid going down a rabbit hole that ends up lasting all day. The amount of time you allocate will vary depending on how many people are participating, but I find between **30-90 minutes** to be sufficient for a first pass of an interface inventory. Set a timer, throw on some *Jeopardy* music (well, maybe not *Jeopardy* music, but maybe some other music that sets an upbeat mood for the exercise), and have the participants concentrate on screenshotting the unique UI patterns they encounter.

##### Dig deep
Which parts of the site should participants capture in the interface inventory? Short answer: *everything*. Any UI piece that is part of the owned user experience should be documented.  

This is difficult as organizations tend to favor certain parts of the experience (*cough* homepage *cough*) over others. For example, people working on an e-commerce website tend to focus on the core shopping experience, even though areas like customer support, FAQs, sizing charts, 404 pages, legal terms are all extremely important to the user experience. Remember, users perceive your brand as a singular entity and don't care about your organizational structure, tech stack, or anything else that might cause disparities in the UI. So encourage interface audit participants to be as thorough as possible during the exercise.

#### Step 4: present findings
The screenshotting exercise can be a bit overwhelming, so be sure the team takes a break after the exercise is complete. Get some food, grab some coffee, and stretch your legs for a bit. Once everyone's feeling refreshed, it's time to discuss what everybody captured.

Have each participant spend 5 or 10 minutes presenting each UI category to the group. Here's where the fun begins. Presenting to the group allows the team to discuss the rationale behind existing UI patterns, and also kickstarts a conversation about naming conventions. 

**Naming things is hard**. It's fascinating to hear the inconsistent names designers, developers, product owners, and other stakeholders give for the same UI pattern. "Oh, we call that the utility bar." "Oh we call it the admin nav." "Oh we call it the floating action area!" This exercise is an opportunity to unearth and iron out disparities between pattern labels, and also establish names for previously-unlabeled patterns. Don't feel like you need to come to a consensus on patterns' final names in the course of 10 minutes; this exercise is simply meant to kickstart a broader discussion.

Once every category has been presented and discussed, all the participants should send their slides to the exercise leader. The leader will then combine everything into one giant über-document, which will fast become a wrecking ball of truth and justice.  

#### Step 5: regroup and establish next steps
With the über-document in hand, now it's time to et the entire organization on board with crafting an interface design system. 

Have you ever wanted to see a CEO cry? Laying bare all your UI's inconsistencies is a great way to make that happen! One of the most powerful aspects of an interface inventory is that you can show it to anyone, including non-designers and developers, and they'll quickly recognize that having 37 unique button styles probably isn't a good idea. Here's your opportunity to make it crystal clear to stakeholders that approaching your UI in a more systematic way makes great sense.

In addition to selling the idea through to key stakeholders, all the hard work and discussion that went into the initial interface inventory exercise should be translated into the seeds of your future pattern library. 

It's very likely the initial exercise didn't capture every unique UI pattern, so you may need to conduct another interface audit exercise to capture a more complete picture of your UI patterns. This may involve a large group again, but in reality a smaller, cross-disciplinary team will be the ones who will be going through the über-document and establishing next steps for the design system. 

Once the gaps in the interface inventory have been filled in, the working group can have some important conversations about next steps for the design system. Some key questions for this group to cover:

- Which patterns should stay, which should go, and which can be merged together?
- What pattern names should we settled on?
- What are the next steps to translate the interface inventory into a living pattern library?

### Benefits of an Interface Inventory
Creating an interface inventory can be a big undertaking, but the benefits of making one are many:

- **Captures all patterns and their inconsistencies** — An interface inventory rounds up all the unique patterns that make up your UI. Seeing all those similar-but-still-different patterns next to each other exposes redundancy and underscores the need to create a consistent, cohesive experience.
- **Gets organizational buy-in** — Having a large, diverse group of disciplines participate in the exercise helps everyone understand the value of creating and maintaining a consistent user interface. Also, the interface inventory über-document can be a tremendously powerful tool for convincing stakeholders, bosses, and clients to invest in an interface design system.
- **Establishes a scope of work** — An interface inventory helps design teams determine the level of effort required to design and build each UI pattern as part of a design or redesign project. Which components will be easy and relatively difficult to convert into a responsive environment? What are the content, design, and development considerations around each component? An interface inventory enables teams to have important conversations that help establish a project's realistic scope and timeline.  
- **Lays the groundwork to a sound interface design system** — The interface inventory is an important first step for setting up a comprehensive pattern library. It's essential to capture all existing UI patterns in order to determine which patterns will make the final cut in the living design system. The interface audit exercise also helps teams establish a shared vocabulary, which will be crucial for the success of the eventual design system. 

### Forgiveness, not permission
Even if they say no, do it anyways. Much like building in performance and accessibility and responsiveness into our experiences, a systematic way. 

### When to establish a pattern library
Interface design systems and their accompanying pattern libraries are often done in conjunction with a new design or redesign project, replatforming effort, some other project. Piggybacking off another effort is a great way to sneak a pattern library project into your organization.

But establishing a pattern library doesn't necessarily need to be attached to another project. If you can convince your clients and bosses to pony up the cash and resources to make things happen, then good on you! 

- In-house vs client work

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