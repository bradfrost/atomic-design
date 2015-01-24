---
layout: page
title: Designing Systems
chapterTitle: Chapter 1
permalink: /chapter-1/
---

A long, long time ago, there were these things called _books_. Remember them? These contraptions were heavy and bulky and made from the pulp of dead trees. Inside these books were things called _pages_. You turned them, and they cut your fingers.

Awful things. I’m so glad these book things with their razor-sharp pages aren’t around anymore.

Oh wait.

## Our paginated past
The _page_ has been with us for a long time now. A few millennia, actually. The first books were thick slabs of clay created about 2,000 years ago, which quickly replaced scrolls as the preferred way to consume the written word. *(note: footnote referring back to The Shallows)*. And while reading technology has come a long way – from parchment to paperback to pixels – the concept of the page holds strong to this day. 

The page metaphor has been baked into the lexicon of the Web since the very beginning. Tim Berners-Lee invented the World Wide Web so that he, his colleagues at CERN, and other academics could easily share and link together their world of *documents*. This document-based, academic genesis of the Web is why the concept of the *page* is so deeply ingrained in the vocabulary of the internet.

So what? 

As we’ll discuss throughout this book, the way things are named very much impact how they’re perceived and utilized. Thinking of the Web as *pages* has real ramifications on how people interact with web experiences, and influences how we as an industry go about creating Web interfaces.

From the beginning, the page metaphor provided users with a familiar language for which to navigate this brave new World Wide Web. Concepts like bookmarking, pagination, etc. helped new Web users explore and eventually master an entirely new medium using conventions they were already comfortable with.

{% include figure.html src="../images/content/chrome-webpage.png" caption="Chrome browser displaying ‘This webpage is not available’ message" %}

The page was–and continues to be–a very visible and helpful metaphor for the end users of the Web. It also has a profound influence on how Web experiences are created.

In the early days of the Web, companies looking to get online simply translated their printed materials onto their websites. But even though these brochure websites offered a very one-dimensional perspective of what the Web could offer, viewing websites as digital representations of the printed page was easy for creators to wrap their heads around. 

But we’re now 25 years into this new medium, and this once-necessary figure of speech has overstayed its welcome. Unfortunately, the page metaphor continues to run deep with respects to how we scope and execute our Web projects. Here are just a few examples I hear on a regular basis:

“We’re a startup looking to launch a 5-*page* website this October…”

“Brad, how long will the home *page* take to build?”

“How are we ever going to redesign this university website that contains over 30,000 *pages*?!”

All of the above statements make the fundamental mistake of assuming a *page* is a uniform, isolated, quantifiable thing. The reality is that the Web is a fluid, bi-directional, interdependent medium, and as soon as we come to terms with that fact the notion of the *page* quickly erodes as a useful means to scope and create Web experiences.

How long will a homepage take to build? Well, that sort of depends on what’s on it, right? Maybe the homepage simply consists of a  tagline and a background image, which means it could be done by lunch. Or maybe it’s chock full of carousels, dynamic forms, and third-party integrations. In that case, maybe the homepage will take several months to complete. 

As for the 30,000-page university website, it might be tempting to declare “Thousands of pages!? Wow, that sounds challenging!” But in reality, those 30,000 pages may consist of three content types and two over-arching layouts.

Ultimately, a project’s level of effort is much better determined by the functionality and [components](http://bradfrost.com/blog/post/scope-components-not-pages/) contained within those pages, rather than on the quantity of pages themselves.

The page metaphor served its purpose helping users familiarize themselves with the Web, and provided creators with a necessary transitional language for which to create for a brand new medium. But in order to create thoughtful interfaces meant to be served to a multitude of connected devices, the time has come for us to evolve beyond the page.

## Tearing up the page
Thankfully, the Web community is hard at work establishing principles and practices to help us effectively talk about and create for the Web. And there’s one concept the keeps popping up in every conversation about how to create successful Web experiences: **modularity**. 

The concept of modularity predates the Web by a long shot. The Industrial Revolution brought about interchangeable parts
and Henry Ford’s assembly line, which forever transformed the automobile-manufacturing process. Early cars and components were individually crafted, which led to many safety and maintainability nightmares. Ford broke the automobile down into its component parts, and modularized the assembly process. The results spoke for themselves: more uniform, reliable, safer cars rolled out of the factory, and in record time to boot.   

As the machine age transitioned into the computer age, the computer science field began practicing object-oriented programming and establishing important modular concepts like *separation of concerns* and the *single responsibility principle*. It is from this world that the World Wide Web was born, so it’s no surprise that [modular design](http://www.w3.org/DesignIssues/Principles.html#Modular) quickly became a design principle for the architecture of the Web. 

Slowly but surely these concepts found their way into web designers’ workflows. In the early 2000’s we saw the introduction of libraries like [YUI](http://yuilibrary.com/) and [jQuery UI](http://jqueryui.com/), which provided developers with a toolkit of widgets and patterns to better create interactive interfaces.

If modularity has been around for such a long time, why are we talking about it now?

The short answer is that modularity matters now more than ever. Right now, our entire industry is drowning in a sea of devices, viewport sizes, and online environments. And things aren’t slowing down anytime soon.

> Disruption will only accelerate. The quantity and diversity of connected devices—many of which we haven't imagined yet—will explode, as will the quantity and diversity of the people around the world who use them. Our existing standards, workflows, and infrastructure won't hold up. Today's onslaught of devices is already pushing them to the breaking point. They can't withstand what's ahead. <cite>[The Future-Friendly manifesto](http://futurefriendlyweb.com/)</cite>

{% include figure.html src="../images/content/devices.jpg" caption="These are just some of the connected devices we need to worry about." %}

Like it or not, this multi-device universe is now our reality. It was hard enough to get our Web pages to display consistently in a handful of desktop browsers, but we’re now tasked with ensuring our web experiences look and function beautifully on a plethora of smartphones, tablets, phablets, netbooks, notebooks, desktops, TVs, game consoles, and more. 

In order to address this reality while maintaining our sanity, it’s absolutely necessary for us to take a step back and break these giant responsibilities into smaller, more manageable  chunks.

And that’s exactly what folks are doing. The spirit of modularity is weaving its way into every aspect of the Web creation process, and is having profound effects on organizations’ strategy, process, content, design, and development.

### A manageable strategy
Every organization is finally realizing that bulldozing their entire website and replacing it with a New-And-Shiny™ website every three-to-eight years isn’t (and never was) an optimal solution.

Out with the old! In with the new! It’s certainly an attractive prospect. But even before the launch-party confetti is swept up, the calls start coming in. “You moved my cheese!” cry the users, who spent years learning the previous interface and functionality. 

When massive redesigns launch with significant changes to the experience, users get knocked down what Jared Spool calls [“Magic Escalator of Acquired Knowledge”](http://www.uie.com/articles/magic_escalator/). Huge redesigns are a jolt to the system, and newly-frustrated users have to spend a great deal of time and energy relearning the experience in order to slowly climb back up that escalator of acquired knowledge. 

In addition to disorienting users, these monolithic redesigns don’t get to the the organizational root of the problem. Without a fundamental change in process, history is bound to repeat itself, and what’s New-And-Shiny™ today becomes Old-And-Crusty™ tomorrow. The cycle repeats itself as companies push off minor updates until the next Big Redesign, ultimately paralyzing themselves and frustrating users in the process.

Thankfully, even massive organizations are taking cues from the smaller, leaner startup world, and are striving to get things out the door quicker. By creating *minimum viable products* and shipping often to iteratively improve the experience, organizations are able to better address user feedback and keep up with the ever-shifting Web landscape.

Moving away from Ron-Popeil-esque, set-it-and-forget-it redesigns requires deliberate changes in organizational structure and workflow. Which is a heck of a lot easier said than done.

### An iterative process 
If I had a quarter for every time I heard some stakeholder declare “we’re trying to be more agile,” I’d be orbiting the earth in my private spacecraft instead of writing this book.

This desire to be more agile is commendable. But “agile” is a loaded term, and there are big differences between capital-“A” Agile and lowercase-“a” agile. Capital-“A” Agile is a specific methodology for software development, equipped with a [manifesto](http://www.agilemanifesto.org/) and accompanying frameworks like [Scrum](http://en.wikipedia.org/wiki/Scrum_%28software_development%29) and [Lean](http://en.wikipedia.org/wiki/Lean_software_development). 

Lowercase-“a” agile is more of an informal desire to create an efficient process. That desire may certainly involve adopting general [principles](http://www.agilemanifesto.org/principles.html) from capital-“A” Agile, but it may not mean adopting the exact process in its entirety. Brett Harned explains why it can be challenging to :

> We want to be more agile; we’re embracing change, continuing improvement, being as flexible as possible, and adapting as we see fit. The thing is, we won’t ever truly be Agile, as the Manifesto states. That’s okay, as long as we say what we will be. <cite>[Brett Harned](http://cognition.happycog.com/article/diy-process)</cite>

In this multi-device age, it’s essential to move away from the rigid Waterfall workflows of the past.  And, yes, modularizing work so that 
- 
- 
- Iteration “sprints”
- Getting into the final environment faster

In Chapter 4, we’ll discuss important process considerations in order to establish an effective pattern-based workflow.

### Team Chunk: 
Karen McGrane [Content Strategy for Mobile](http://www.abookapart.com/products/content-strategy-for-mobile)

### Visually repaired
Visual designers are summoning their knowledge of effective brand identity, where  systems. 
Visual design: Samantha Warren - style tiles, Dan Mall - element collages, Andy Clarke “design atmosphere”: color, typography, texture.

### Code
Code: Object oriented programming influencing CSS architecture, [JavaScript patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/), web components, 

### UI Design
> We’re not designing pages, we’re designing systems of components. <cite>[Stephen Hay](http://bradfrost.com/blog/mobile/bdconf-stephen-hay-presents-responsive-design-workflow/)</cite>

What is an interface made of? What are our Lego<sup>®</sup> bricks? What are our Subway sandwich pieces that we combine into millions of delicious combinations?

It’s these questions that we’ve been asking frequently ourselves  ever since the 


and UI frameworks like [Bootstrap](http://getbootstrap.com/) and Foundation by Zurb

[Responsive deliverables](http://daverupert.com/2013/04/responsive-deliverables/) by Dave Rupert.

## Design systems save the day
Advantages of design systems: promote consistency, establish a consistent vocabulary, create more robust deliverables, establish a system that can be modified and extended, future-friendly
In her phenomenal book [Front-end Style Guides](http://maban.co.uk/projects/front-end-style-guides/), Anna Debenham explains the myriad benefits of establishing a front-end style guide:
- Establish a consistent, shared vocabulary between everyone involved

### Design system pitfalls
- Time consuming to create
- Treated as a auxiliary project
- Often too abstract
- Seen only as a designer/developer tool
- Often created after a project launches
- Often incomplete/only serving present cases
- Lacking a clear methodology

## UI frameworks, in theory and in practice
- The rise of UI frameworks

- Issues with UI frameworks and pattern libraries

## In search of a methodology
- Recap modularity as a trend. 

Lorem ipsum dolar yadda yadda yadda to be continued…


