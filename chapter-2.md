---
layout: page
title: Atomic Design Methodology
chapterTitle: Chapter 2
permalink: /chapter-2/
---

My search for a methodology to craft interface design systems led me to look for inspiration in other fields and industries. Given this amazingly complex world we've created, it seems only natural that other disciplines would have tackled similar problems we could learn from and appropriate. As it turns out, loads of other fields [such as industrial design and architecture](http://us5.campaign-archive1.com/?u=7e093c5cf4&id=ead8a72012&e=ecb25a3f93) have developed smart modular systems for manufacturing immensely complex objects like airplanes, ships, and skyscrapers. 

But my original explorations kept creeping back to the natural world, which ultimately triggered memories of sitting at a rickety desk in my high school's chemistry lab. 

## Taking Cues from Chemistry
My high school chemistry class was taught by a no-nonsense Vietnam vet with an extraordinarily impressive mustache. Mr. Rae's class had a reputation for being one of the hardest classes in school, largely in part of an assignment that required students to balance hundreds upon hundreds of chemical equations contained in a massive worksheet. 

If you're anything like me, you'll need a bit of a refresher to recall what a chemical equation looks like, so here you go:

{% include figure.html src="../images/content/chemical-equation.png" caption="An example of a chemical equation showing hydrogen and oxygen atoms combining together to to form a water molecule" %}

Chemical reactions are represented by chemical equations, which often show how atomic elements combine together to form molecules. In the above example, we see how hydrogen and oxygen combine together to form water molecules. 

Apparently Mr. Rae's strategy of having students balance page after page of chemical equations worked, because I'm coming back to it all these years later for inspiration on how to approach interface design.

In the natural world, atomic elements combine together to form molecules, which in turn can combine further to create more complex molecules. These molecules continue combining to eventually form simple organisms, which in turn continue combining to form everything in our cosmos. To expound on this further:

- **Atoms** are the basic building blocks of all matter. These chemical elements can't be broken down further without losing their meaning (yes, it's true atoms are composed of even smaller bits like protons, electrons, and quarks, but that's outside the realm of this discussion). Each atomic element has distinct properties, and while they're the fundamental building blocks of matter, they aren't terribly useful on their own and they're a bit of an abstract concept.
- **Molecules** are groups of two or more atoms held together by chemical bonds. They can be relatively simple combinations of atoms (like H2O), or can combine further into relatively complex macromolecules like proteins that form the scaffolding for organic life. These molecules have their own unique properties, and are relatively more tangible and operational than atoms.
- **Organisms** are relatively complex combinations of molecules.

It's amazing when you think about it. The rich, complex, diverse tapestry of life on earth and beyond can be broken down into this finite set of atomic elements.

{% include figure.html src="../images/content/periodic-table.png" caption="The periodic table of chemical elements" %}

## The Atomic Design Methodology
By now you might be wondering why we're talking about atoms, molecules, and organisms. Maybe you're even angry at me for forcing you  

As it turns out, we have this same finite set of atomic elements we can apply that same process that happens in the natural world to our user interfaces. 

Atomic design is a methodology composed of five distinct stages working together to create deliberate interface design systems. **The five stages of atomic design are are:**

- Atoms
- Molecules
- Organisms
- Templates
- Pages


{% include figure.html src="../images/content/atomic-design-process.png" caption="Atomic design is atoms, molecules, organisms, templates, and pages working together to create an effective interface design system." %}

## Atoms
{% include figure.html src="../images/content/atomic-design-atoms.png" caption="atoms" %}

If atoms are the basic building blocks of matter, then what are the atoms of our interfaces? Translated to interfaces, atoms are basic tags, such as form labels, inputs or buttons. They also include more abstract elements like color palettes, fonts, and animations.

Atoms are abstract and aren't often terribly useful on their own, but they provide a useful reference and allow you to see all your global styles laid out at a glance.

- Atoms definition: basic tags and other design elements that can't be broken down any further.
- Why atoms: see all interface styles abstracted at a glance, etc
- too abstract to be useful, etc

## Molecules
{% include figure.html src="../images/content/atomic-design-molecules.png" caption="molecules" %}

In chemistry, molecules are groups of atoms bonded together, which take on new properties as a result.

In interfaces, molecules are groups of elements that function together as a unit. For example, a form label, search input, and button atom can combine them together to form a search form molecule.

Building up from atoms to molecules encourages a “do one thing and do it well” mentality, and encourages creating reusable interface patterns.

- Molecules definition: a group of atoms joined together to form a relatively simple module. For example, a label, input, and button atom joining together to form a search form molecule.
- Why Molecules: single responsibility principle, assemble rather than deconstruct, testing, etc

## Organisms
{% include figure.html src="../images/content/atomic-design-organisms.png" caption="organisms" %}

Organisms are groups of molecules (and possibly atoms) joined together to form distinct section of an interface.

Organisms can consist of similar and/or disparate molecule types. For example, a masthead organism might consist of a logo, navigation, and search form, while a “product grid” organism might consist of the same product info molecule repeated over and over.

Building up from molecules to organisms encourages creating standalone, portable, reusable components.

- Organisms definition: groups of molecules (and possibly atoms) joined together to form distinct section of an interface.
- Why Organisms: reusable interface components, more concrete than atoms and molecules, encourages portability, etc


## Templates
{% include figure.html src="../images/content/atomic-design-templates.png" caption="templates" %}

With templates, we break our biochemistry analogy to get into language that makes more sense to clients and final output. Templates are composed mostly of organisms combined together to form page-level objects.

Templates provide context for these relatively abstract molecules and organisms, which is helpful for designers and clients alike.

Templates mostly focus on content structure (such as character length, image size, etc) rather than the actual content.

- Breaking the chemistry analogy to get into the deliverables language
- Templates definition: page-level documents that provide context for these relatively abstract molecules and organisms, and  focus on content structure
- Why Templates: focus on content structure, can begin as wireframes and evolve over time, etc

## Pages
{% include figure.html src="../images/content/atomic-design-pages.png" caption="pages" %}

Pages are specific instances of templates and swap out placeholder content with real representative content to give an accurate depiction of what a user will ultimately see.

Pages are essential for testing the effectiveness of the design system. This final form allows us to loop back to modify our molecules, organisms, and templates to better address the real context of the design.

Pages also provide a place to test variations in templates, such as testing an article containing a 40-character-length headline and other article with a 340-character-length headline. What does it look like when a user has one item in their shopping cart versus 10 items with a discount code applied? These specific page instances test the resiliency of the system, influencing how the underlying molecules, organisms, and templates are constructed.

- Page definition: specific instances of a template. Replaces content structure with real representative content
- Why pages: Tests the resiliency of the system, test variations in content structure, extremely concrete, it's what the client naturally ends up focusing on since it's what
- Page considerations: Clients/colleagues can get distracted by representative content ("I don't like how I look in that photo") vs commenting on effectiveness of the design.
Atomic design summary: recap atoms, molecules, organisms, templates, and pages
Discuss the advantages of atomic design, especially the ability to traverse between abstract and concrete

### Advantages
- Traverse between abstract and concrete. Can simultaneously see things abstracted and step through to see things in context
- Built in hierarchy
- Shared vocabulary - stakeholders can get on board with the concept
- The Part and the Whole - **Not a linear process** but rather a mental model
- What's in a name? Discussing the importance of naming ("Modules" "components" "elements" etc)
- Atomic Design in Practice 
- What atomic design isn't - CSS or JS methodology
- Nothing new: why atomic design is different than other things that have been around for a long time.
- Recap of the the atomic design methodology

http://china.org.cn/china/2015-03/17/content_35077927.htm

*As it turns out, Andy Clarke had already touched on wrote a chapter of a book called [Designing Atoms and Elements](http://stuffandnonsense.co.uk/blog/about/an-extract-from-designing-atoms-and-elements), which discusses modular design and breaking a visual design into its "design atmosphere": the color, typography, and texture of a design sans layout.
