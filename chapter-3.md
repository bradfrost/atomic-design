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
- a replacement for a content management system.

Let's walk through these points, starting with the term *static site generator*. Static site generator tools take in some source code & assets, compile them, and spit plain-ol' HTML, CSS, and JavaScript out the other end. **Pattern Lab takes source code – namely patterns – and compiles those patterns into a functional front-end UI inside a pattern library shell**.

So what does Pattern Lab look like out of the box? Drumroll, please. 

{% include figure.html src="../images/content/pattern-lab-default.png" caption="The default Pattern Lab dashboard. What it lacks in good looks, it makes up for in utility." %}

Not a terribly inspiring design, eh? Believe it or not, this minimal (one may even say "lack of") design is deliberate. To avoid incorrect classification as a UI framework like Bootstrap, the design is deliberately stripped down so no one would mistakenly use Pattern Lab's demo UI as suggested styles. Pattern Lab doesn't give you any answers as to how to design or architect your front-end code; *you have to do all that work yourself.* The look & feel, naming conventions, syntax, structure, libraries, and scripts you choose to use to create your UI is entirely up to you. Heck, you can even use UI frameworks like Bootstrap within Pattern Lab. Pattern Lab is just there to help stitch everything together.

As a technical aside, Pattern Lab uses PHP as the engine that stitches patterns together and generates the pattern library. However, you don't need to be a PHP wizard to use Pattern Lab any more than you have to know how to build an internal combustion engine in order to drive a car. Moreover, your final website doesn't have to be built with PHP in order to use the tool, as Pattern Lab's output is backend-agnostic HTML, CSS, and JavaScript. But if you're one of those cool kids who thinks using a PHP-based tool will somehow ruin your reputation, there's also a [Node.js version](https://github.com/pattern-lab/patternlab-node) thanks to web developer [Brian Muenzenmeyer](http://www.brianmuenzenmeyer.com/). 

If that all sounded like gibberish to you, don't worry. This chapter focuses on the over-arching features and principles behind Pattern Lab rather than going too far down the technical rabbit hole. Check out [Pattern Lab's documentation](http://patternlab.io/docs/index.html) to dive into the nitty gritty.

## Building atomic design systems with Pattern Lab
In order to understand the core concept behind Pattern Lab, you need to understand Russian nesting dolls. 

{% include figure.html src="../images/content/russian-nesting-dolls.jpg" caption="Russian nesting dolls. <a href='https://www.flickr.com/photos/tromal/6901848291/'>via Flickr user Tromal</a>" %}

Matryoshka dolls, also known as Russian nesting dolls, are beautifully-carved hollow wooden dolls of increasing size that are placed one inside the other. Patterns in Pattern Lab operate in a similar manner: the smallest patterns (atoms) are included inside bigger patterns (molecules), which are included in even bigger patterns (organisms), which are in turn included in even bigger patterns (templates). 

Constructing UIs in this manner helps keeps things [DRY](https://en.wikipedia.org/wiki/Don't_repeat_yourself), which is a long-standing computer science principle that stands for "Don't Repeat Yourself." Make a change to a pattern, and anywhere that pattern is employed will magically update with those changes. This saves an extraordinary amount of time and grief, and certainly beats the pants off sifting through hundreds of Photoshop documents for every instance of a pattern just to make a simple change.

To make this happen Pattern Lab uses the include feature of [Mustache](https://mustache.github.io/), a logic-less templating language. Here's what a Mustache include looks like:

<pre>
<code>
{% raw %}{{> atom-thumbnail }}{% endraw %}
</code>
</pre>

This is Mustache code, in case the double curly braces ({% raw %}`{{}}`{% endraw %}) that look like little mustaches didn't give it away. The greater than symbol (`>`) is Mustache's way of telling Pattern Lab "hey, I want you to include an atom pattern called "thumbnail". Pattern Lab will go searching through its folders of patterns to find an atom named "thumbnail".

{% include figure.html src="../images/content/pattern-lab-file-structure.png" caption="This is what Pattern Lab's default patterns folder structure looks like. You can name and categorize these folders however you'd like, even removing the labels 'atoms', 'molecules', and 'organisms'. The most important consideration is to establish naming & categorization that is most clear for your team." %}

Now that we know what an include looks like, let's put it into practice and take a look at a few patterns from a website I helped make for Time Inc. Here was one reusable pattern we designed:

{% include figure.html src="../images/content/pattern-lab-molecule.png" caption="Here we have a basic block pattern consisting of a thumbnail image, headline, and excerpt.</a>" %}

When we take a peek behind the curtain to see how this pattern is constructed, we see something 

<em>[<small>Note from Brad: Forgive the mess with the markup formatting. I need to look into how to properly escape characters and highlight syntax in a way that works for the site but also for the eventual ebook.</small>]</em>

<pre>
<code>
{% raw %}
\<div class="block-post"\>
    \<a href="{{ url }}"\>
        {{> atoms-thumb }}
        \<h3\>{{ headline }}\</h3\>
       \<p\>{{ excerpt }}\</p\>
    \</a\>
\</div\>
{% endraw %}
</code>
</pre>

You can see we have HTML markup consisting of a wrapper `div` with a class name of `block-post`, a link, a Mustache include for the thumbnail image, a `<h3>` tag for the headline, and a `<p>` tag for the excerpt. You'll notice there's more Mustache code for `url`, `headline`, and `excerpt`, which we'll use later to swap in actual content. More on that in a bit.

Now that we have our pattern markup established, we can now include that chunk of code in even bigger patterns using the same include pattern:

<pre>
<code>
{% raw %}{{> molecules-block-post }}{% endraw %}
</code>
</pre> 

a

<pre>
<code>
{% raw %}
\<header role="banner"\>
    {{> atoms-logo }}
    {{> molecules-primary-nav }}
    {{> molecules-search }}
\</header\>
{% endraw %}
</code>
</pre>

And now we can include that relatively complex pattern anywhere we need it.

<pre>
<code>
{% raw %}{{> organisms-header }}{% endraw %}
</code>
</pre> 

This structure encourages designers and developers to build reusable UI patterns while at the same time constructing the final put-together UI. The final interface and its underlying design system is one in the same. 

## A separation between structure and data
- Templates and pages - replacing default data with real representative content (mention how the new version of Pattern Lab supports YAML, Markdown, etc in addition to JSON)

## Pattern variations with pseudo-patterns
- Different permissions. Homepage differences 

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