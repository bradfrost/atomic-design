---
layout: page
title: Tools of the Trade
chapterTitle: Chapter 3
permalink: /chapter-3/
---

In the last chapter, I introduced the atomic design methodology for constructing user interfaces. Hopefully you'll find atomic design to be a helpful mental model for constructing UI design systems, but now it's time to climb down from the ivory tower and actually put atomic design into practice *in the real world*.

The cornerstone of pattern-based design and development is the pattern library, which serves as a centralized hub of all the UI components that comprise your user interface. As we discussed in Chapter 1, the benefits of pattern libraries are many:

- They **promote consistency and cohesion** across the entire experience.
- They **speed up your team's workflow**, saving time and money.
- They **establish a more collaborative workflow** between all disciplines involved in a project.
- They **establish a shared vocabulary** between everyone in an organization, including outside vendors.
- They **provide helpful documentation** to help educate stakeholders, colleagues, and even third parties.
- They **make cross-browser/device, performance, and accessibility testing easier**.
- They **serve as a future-friendly foundation** for teams to modify, extend, and improve upon over time.

That all sounds wonderful, right? I can almost hear you saying, "I need this whole pattern library thing in my life." But how do we make pattern libraries happen? Well, you've come to the right place, friend, because the rest of this book is dedicated to exactly that. This chapter will introduce helpful tools for creating pattern libraries, and the following chapter will discuss how to make patterns a cornerstone of your design and development workflow. 

I'll be talking about the qualities of effective pattern libraries through the lens of a tool called [Pattern Lab](http://patternlab.io), an open-source project created by me and [Dave Olsen](http://dmolsen.com) to execute atomic design systems. While I'll excitedly discuss Pattern Lab and its various features, I want to stress that the point of this chapter is to cover the characteristics of well-constructed pattern libraries, not sell any one specific tool to you. Hell, Pattern Lab isn't even for sale! No single tool will be a perfect fit for all readers, but be sure to keep the following principles in mind when deciding what tools to use to create your pattern libraries.

## Just what exactly is Pattern Lab?
Before we dive into the nuts and bolts of how Pattern Lab works, it's important to take time to explain what the tool is and isn't.

### Pattern Lab is…
- a static site generator tool for building atomic design systems.
- a pattern documentation and annotation tool.
- a pattern starter kit.

### Pattern Lab isn't…
- a UI framework like Bootstrap or Foundation.
- language, library, or style dependent.
- a replacement for content management systems.

Let's walk through these points, starting with the term *static site generator*. Static site generator tools take in some source code & assets, compile them, and spit plain-ol' HTML, CSS, and JavaScript out the other end. **Pattern Lab takes source code – namely patterns – and compiles those patterns into a functional front-end UI inside a pattern library shell**.

So what does Pattern Lab look like out of the box? Drumroll, please. 

{% include figure.html src="../images/content/pattern-lab-default.png" caption="The default Pattern Lab dashboard. What it lacks in good looks, it makes up for in utility." %}

Not a terribly inspiring design, eh? Believe it or not, this minimal (one may even say "lack of") design is deliberate. To avoid incorrect classification as a UI framework like Bootstrap, the design is deliberately stripped down so no one would mistakenly use Pattern Lab's demo UI as a framework. Pattern Lab doesn't give you any answers as to how to design or architect your front-end code; *you have to do all that work yourself.* The look & feel, naming conventions, syntax, structure, libraries, and scripts you choose to use to create your UI is entirely up to you. Heck, you can even use UI frameworks like Bootstrap inside of Pattern Lab. Pattern Lab is just there to help stitch everything together.

As a technical aside, Pattern Lab uses PHP as the engine that stitches patterns together and generates the pattern library. However, you don't need to be a PHP wizard to use Pattern Lab any more than you have to know how to build an internal combustion engine in order to drive a car. Moreover, your final website doesn't have to be built with PHP in order to use the tool, as Pattern Lab's output is backend-agnostic HTML, CSS, and JavaScript. But if you're one of those cool kids who thinks using a PHP-based tool will somehow ruin your reputation, there's also a [Node.js version](https://github.com/pattern-lab/patternlab-node) of Pattern Lab thanks to web developer Brian Muenzenmeyer. 

If that all sounded like gibberish to you, don't worry. Much like the fact that you can drive a car without knowing how an internal combustion engine works, you can operate Pattern Lab without needing to know

## Building atomic design systems with Pattern Lab
In order to understand how the core of Pattern Lab works, all you need to know is how Russian nesting dolls work. 

{% include figure.html src="../images/content/russian-nesting-dolls.jpg" caption="Russian nesting dolls. <a href='https://www.flickr.com/photos/tromal/6901848291/'>via Flickr user Tromal</a>" %}

Matryoshka dolls, or Russian nesting dolls, are beautiful-carved, hollow, wooden dolls of increasing size that are placed one inside the other. Patterns in Pattern Lab operate in a similar manner: the smallest patterns (atoms) are included inside bigger patterns (molecules), which are included in even bigger patterns (organisms), which are in turn included in even bigger patterns (templates). 

Constructing UIs in this manner helps keeps things DRY, which is a long-standing computer science principle that stands for "Don't Repeat Yourself." Make a change to one of the patterns, and anywhere that pattern gets included will magically update with those changes. 

- Building the final UI and building its underlying design system is one in the same. 

## A separation between structure and data
- Discuss replacing default data with real representative content (mention how the new version of Pattern Lab supports YAML, Markdown, etc in addition to JSON)
- 

<pre>
<code>
{% raw %}{{> organisms-header }}{% endraw %}
</code>
</pre>

### Viewport tools for flexible patterns
- The importance of flexible patterns
- The dangers of focusing on popular device dimensions
- Ish
- Disco mode
- It's helpful for designers and developers to see where there might be 
- It's more helpful as a client and colleague education tool. Helps them appreciate that you're creating a user interface that looks and functions great no matter what viewport size 

### Code View
- A good pattern library allows teams to look under the hood to see the source code. HTML, CSS, JS, template code

### Annotations
- Annotation tool - the issue tool
- Documentation tools

### Pattern Lineage


### More tools
- Plugins
- Next version


## To each their own
[Styleguides.io/tools.html]()

## Making it all work
This chapter we 