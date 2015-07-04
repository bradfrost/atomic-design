---
layout: page
title: Atomic Design Methodology
chapterTitle: Chapter 2
permalink: /chapter-2/
---

My search for a methodology to craft interface design systems led me to look for inspiration in other fields and industries. Given this amazingly complex world we've created, it seemed only natural that other fields would have tackled similar problems we could learn from and appropriate. As it turns out, loads of other fields [such as industrial design and architecture](http://us5.campaign-archive1.com/?u=7e093c5cf4&id=ead8a72012&e=ecb25a3f93) have developed smart modular systems for manufacturing immensely complex objects like airplanes, ships, and skyscrapers. 

But my original explorations kept creeping back to the natural world, which ultimately triggered memories of sitting at a rickety desk in my high school's chemistry lab. 

## Taking Cues from Chemistry
My high school chemistry class was taught by a no-nonsense Vietnam vet with an extraordinarily impressive mustache. Mr. Rae's class had a reputation for being one of the hardest classes in school, largely in part of an assignment that required students to balance hundreds upon hundreds of chemical equations contained in a massive worksheet. 

If you're like me, you may need a bit of a refresher to recall what a chemical equation looks like, so here you go:

{% include figure.html src="../images/content/chemical-equation.png" caption="An example of a chemical equation showing hydrogen and oxygen atoms combining together to to form a water molecule" %}

Chemical reactions are represented by chemical equations, which often show how atomic elements combine together to form molecules. In the above example, we see how hydrogen and oxygen combine together to form water molecules. 

In the natural world, **atomic elements combine together to form molecules. These molecules can combine further to form relatively complex organisms**. To expound a bit further:

- **Atoms** are the basic building blocks of all matter. Each chemical element has distinct properties, and they can't be broken down further without losing their meaning (yes, it's true atoms are composed of even smaller bits like protons, electrons, and neutrons, but that's outside the realm of this discussion). 
- **Molecules** are groups of two or more atoms held together by chemical bonds. These combinations of atoms take on their own unique properties, and become more tangible and operational than atoms.
- **Organisms** are assemblies of molecules functioning together as a unit. These relatively complex structures can range from single-celled organisms all the way up to incredibly complex organisms like human beings.

Of course I'm simplifying the incredibly rich, complex composition of the universe, but the basic gist remains: atoms combine together to form molecules, which continue combining to form relatively complex organisms. This atomic theory means that all matter in the known universe can be broken down into this finite set of atomic elements:

{% include figure.html src="../images/content/periodic-table.png" caption="The periodic table of chemical elements" %}

Apparently Mr. Rae's strategy of having students mind-numbingly balance tons of chemical equations worked, because I'm coming back to it all these years later for inspiration on how to approach interface design.

## The Atomic Design Methodology
By now you may be wondering why we're talking about atomic theory, and maybe you're even a bit angry at me for forcing you to relive memories of high school chemistry class. But this is going somewhere, I promise.

We discussed earlier how all matter in the universe can be broken down into a finite set of atomic elements. As it happens, our interfaces can be broken down into a similar finite set of elements. [Josh Duck's Periodic Table of HTML Elements](http://smm.zoomquiet.io/data/20110511083224/index.html) beautifully articulates how all of our websites, apps, intranets, hoobadyboops, and whatevers are all composed of the same HTML elements.

{% include figure.html src="../images/content/html-periodic-table.png" caption="The periodic table of HTML elements by Josh Duck" %}

Because we're starting with a similar finite set of building blocks, we can apply that same process that happens in the natural world to design and develop user interfaces. 

Enter atomic design.

**Atomic design is a methodology composed of five distinct stages working together to create deliberate interface design systems**. The five stages of atomic design are:

1. Atoms
2. Molecules
3. Organisms
4. Templates
5. Pages


{% include figure.html src="../images/content/atomic-design-process.png" caption="Atomic design is atoms, molecules, organisms, templates, and pages working together to create effective interface design systems." %}

Let's dive into each stage and discuss its role in crafting an interface design system.

## Atoms
{% include figure.html src="../images/content/atomic-design-atoms.png" caption="" %}

If atoms are the basic building blocks of matter, then the **atoms of our interfaces serve as the foundational building blocks that comprise all our user interfaces**. Therefore these atoms would include [basic HTML tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) like form labels, inputs, buttons, and other elements that can't be broken down any further without ceasing to be functional.

{% include figure.html src="../images/content/atoms-form-elements.png" caption="Atoms include basic HTML tags like inputs, labels, and buttons." %}

Each atom in the natural world has its own unique properties. A hydrogen atom contains one electron, while a helium atom contains two. These intrinsic chemical properties have profound effects on their application (for example, the Hindenburg explosion was so catastrophic because the airship was filled with extremely flammable hydrogen gas versus inert helium gas). In the same manner, each interface atom has its own unique properties, such as the dimensions of a hero image, or the font-size of a primary heading. These properties directly influence when they're applied to the user interface.

In addition to the tags that make up our user interfaces, **atoms can also include more abstract elemental items like color palettes, font stacks, and even invisible things like animations**. Defining these elemental properties of our UIs help promote consistency and cohesion throughout the entire experience.

{% include figure.html src="../images/content/styleguide-salesforce-colors.png" caption="The style guide for Salesforce1 defines the color palette used throughout the user interface of the application." %}

In the context of a design system, atoms demonstrate all your global styles at a glance, which can serve as a helpful reference to keep coming back to. But like atoms in the natural world, interface atoms aren't found floating around all on their lonesome. The application of these atoms is where things get interesting.

## Molecules
{% include figure.html src="../images/content/atomic-design-molecules.png" caption="" %}

In chemistry, molecules are groups of atoms bonded together that resultantly take on new properties. In interfaces, **molecules are relatively simple groups of UI elements functioning together as a unit**. For example, a form label, search input, and button can combine them together to create a search form molecule.

{% include figure.html src="../images/content/molecule-search-form.png" caption="A search form molecule is composed of a label atom, input atom, and button atom." %}

When combined, these abstract atoms suddenly have purpose. The label atom now defines the input atom. Clicking the button atom now submits the form. The result is a simple, portable, reusable component that can be dropped in anywhere site search functionality is needed.

Now, assembling elements into simple functioning groups is something we've always done to construct user interfaces. But dedicating a stage in the atomic design methodology to these relatively simple components provides us a few key insights.

Creating simple components helps UI designers and developers adhere to the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle), an age-old computer science principle that encourages a “do one thing and do it well” mentality. Burdening a single pattern with too much complexity makes software unwieldy. Therefore, creating simple UI molecules makes testing easier, encourages reusability, and promotes consistency throughout the interface.

Now we have simple, functional, reusable components that we can put into a broader context. Enter organisms!

## Organisms
{% include figure.html src="../images/content/atomic-design-organisms.png" caption="" %}

**Organisms are relatively complex UI components composed of groups of molecules and possibly even atoms**. These organisms form distinct sections of an interface.

Let's revisit our search form molecule. A search form can often be found in the header of many Web experiences, so let's put that search form molecule into context of a header organism.

{% include figure.html src="../images/content/organism-header.png" caption="The search form molecule placed in the context of the header organism, which also contains the logo atom and the primary navigation molecule." %}

The header forms a standalone section of an interface, even though it contains several smaller pieces of interface with their own unique properties and functionality.

Organisms can consist of similar or different molecule types. A header organism might consist of dissimilar elements such as a logo image, primary navigation list, and search form. We see these types of organisms on almost every website we visit.

{% include figure.html src="../images/content/organisms-headers.png" caption="Organisms like website headers consist of smaller molecules like primary navigation, search forms, utility navigation, and logos." %}

While some organisms might consist of different types of molecules, other organisms might consist of the same molecule repeated over and over again. For instance, visit a category page of almost any e-commerce website and you'll see a listing of products displayed in some form of grid.

{% include figure.html src="../images/content/organisms-product-grid.png" caption="A product grid organism on Gap's e-commerce website consist of the same product item molecule repeated again and again." %}

Building up from molecules to relatively complex organisms provides designers and developers with an important sense of context. Organisms demonstrate those smaller, simpler components in action and serve as distinct patterns that can be used again and again. The product grid organism can be employed anywhere a group of products needs to be displayed, from category listings to search results to related products. 

Now that we have organisms defined in our design system, we can now break our chemistry analogy and apply all these components to something that resembles a Web page!

## Templates
{% include figure.html src="../images/content/atomic-design-templates.png" caption="" %}

And now, friends, it's time to say goodbye to our chemistry analogy. The language of atoms, molecules, and organisms carries with it a helpful hierarchy for us to deliberately construct the components of our design systems. But ultimately we must step into language that is more appropriate for our final output and makes more sense to our clients, bosses, and colleagues. Trying to carry the chemistry analogy too far might confuse your stakeholders and cause them to think you're a bit crazy. Trust me.

**Templates are page-level objects that place components into a layout and articulate the design's underlying content structure**. To build upon our previous example, we can take the header organism and apply it to a homepage template.

{% include figure.html src="../images/content/template.png" caption="The homepage template consists of organisms and molecules applied to a layout." %}

This homepage template displays all the necessary page components functioning together, which **provides context for these relatively abstract molecules and organisms**. When crafting an effective design system, it's critical to demonstrate how components look and function together in the context of a layout to prove the parts add up to a well-functioning whole. We'll discuss this more in a bit.

Another important characteristic of templates is that they **focus on the page's underlying content structure** rather than the page's final content. Design systems must account for the dynamic nature of content, so it's very helpful to articulate important properties of components like image sizes and character lengths for headings and text passages. 

Mark Boulton discusses the importance of defining the underlying content structure of a page:

> You can create good experiences without knowing the content. What you can’t do is create good experiences without knowing your content structure. What is your content *made* from, not what your content *is*. <cite>[Mark Boulton](http://www.markboulton.co.uk/journal/structure-first-content-always)</cite>

By defining a page's skeleton we're able to create a system that can account for a variety of dynamic content, all while providing needed guardrails for the types of content that populates certain design patterns. For example, the homepage template for Time Inc. shows a few key components in action while also demonstrating content structure regarding image sizes and character lengths:

{% include figure.html src="../images/content/template-timeinc-homepage.png" caption="Time Inc.'s homepage template demonstrates the content's underlying content structure." %}

Now that we've established our pages' skeletal system, let's put some meat on them bones!

## Pages
{% include figure.html src="../images/content/atomic-design-pages.png" caption="" %}

**Pages are specific instances of templates that replace placeholder content with real representative content**.  Building upon our previous example, we can take the homepage template and pour representative content into that container to show real content in action.

{% include figure.html src="../images/content/page.png" caption="The page stage replaces placeholder content with real representative content to bring the design system to life." %}

The page stage is most concrete stage of atomic design, and it's important for some rather obvious reasons. After all, this is what users will see when they visit your experience. This is what your stakeholders will sign off on. And this is where you see all those components coming together to form a beautiful and functional user interface. Exciting!

In addition to demonstrating the final interface as your users will see it, **pages are essential for testing the effectiveness of the underlying design system**. It is at the page stage that we're able to take a look at how all those patterns hold up when real content is applied to the design system. Does everything look great and function as it should? If the answer is no, then we can loop back and modify our molecules, organisms, and templates to better address our content's needs.

When we pour real representative content into Time Inc.'s homepage template, we're able to see how all those underlying design patterns hold up.

{% include figure.html src="../images/content/page-timeinc-homepage.png" caption="" %}

We must create systems that establish reusable design patterns and also accurately reflect the reality of the content we're putting inside of those patterns.

**Pages also provide a place to articulate variations in templates**, which is crucial for establishing robust and reliant design systems. Here are just a few examples of template variations:

- A user has one item in their shopping cart and other user has 10 items in their cart.
- A web app's dashboard typically shows recent activity, but that section is suppressed for first-time users. 
- An article contains a 40-character-long headline while other article with a 340-character-long headline.  
- Users with administrative privileges see additional buttons and options on their dashboard compared to users who aren't admins.

In all of these examples, the underlying templates are the same, but the user interfaces change to reflect the nature of the content. These variations directly influence how the underlying molecules, organisms, and templates are constructed. Therefore, creating pages that account for these variables helps us create more resilient design systems.

So that's atomic design! These five distinct stages work together to produce effective user interface design systems. To sum up atomic design in a nutshell: 

- **Atoms** can't be broken down any further and serve as the elemental building blocks of an interface. 
- **Molecules** are collections of atoms that form relatively simple UI components.
- **Organisms** are relatively complex components that form discrete sections of an interface.
- **Templates** place components into a page layout and demonstrate the design's underlying content structure.
- **Pages** apply real content to templates and articulate variations to demonstrate the final UI and test the resiliency of the design system.

## Advantages of atomic design
So why do all of this? What's atomic design good for? These are valid questions. After all, we've been building user interfaces for a long time now without

### The Part and the Whole
- Traverse between abstract and concrete. Can simultaneously see things abstracted and step through to see things in context
- [The Part and the Whole](http://bradfrost.com/blog/post/the-part-and-the-whole/) - **Not a linear process** but rather a mental model

> The painter, when at a distance from the easel, can assess and analyze the whole of the work from this vantage. He scrutinizes and listens, chooses the next stroke to make, then approaches the canvas to do it. Then, he steps back again to see what he’s done in relation to the whole. It is a dance of switching contexts, a pitter-patter pacing across the studio floor that produces a tight feedback loop between mark-making and mark-assessing. <cite>[Frank Chimero](http://read.shapeofdesignbook.com/chapter01.html)</cite>


### Naming with Meaning
What's in a name? Again, modular design and development is nothing new, so naturally. In the two years I've been talking about atomic design, I've had a number of Discussing the importance of naming ("Modules" "components" "elements" etc)
- Built in hierarchy

### Clean separation between structure and data
- Clear separation between pattern structure and the content that goes inside them.
- templates and pages provide a language to discuss variations

Design and content is a bit of a chicken-or-egg situation, as Mark Boulton explains:

> Content needs to be structured and structuring alters your content, designing alters content. It’s not ‘content then design’, or ‘content or design’. It’s ‘content and design’. <cite>[Mark Boulton](http://www.markboulton.co.uk/journal/structure-first-content-always)</cite>

### Atomic design is for interfaces
[Instagram example]
- What atomic design isn't - CSS or JS methodology
- Nothing new: why atomic design is different than simply modular design. Makes a distinction between simple components (molecules) and complex components (organisms)

## Conclusion
- Recap of the the atomic design methodology and its advantages

http://china.org.cn/china/2015-03/17/content_35077927.htm


