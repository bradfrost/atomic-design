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

**Atomic design is a methodology composed of five distinct stages working together to create deliberate interface design systems**. The five stages of atomic design are are:

1. Atoms
2. Molecules
3. Organisms
4. Templates
5. Pages


{% include figure.html src="../images/content/atomic-design-process.png" caption="Atomic design is atoms, molecules, organisms, templates, and pages working together to create effective interface design systems." %}

Let's dive into each stage and discuss its role in crafting an interface design system.

## Atoms
{% include figure.html src="../images/content/atomic-design-atoms.png" caption="" %}

If atoms are the basic building blocks of matter, then the atoms of our interfaces serve as the foundational building blocks that comprise all our user interfaces. Therefore these atoms would include [basic HTML tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element) like form labels, inputs, buttons, and other elements that can't be broken down any further without ceasing to be functional.

{% include figure.html src="../images/content/atoms-form-elements.png" caption="Atoms include basic HTML tags like inputs, labels, and buttons." %}

Each atom in the natural world has its own unique properties. A hydrogen atom contains one electron, while a helium atom contains two. These intrinsic chemical properties have profound effects on their application (for example, the Hindenburg explosion was so catastrophic because the airship was filled with extremely flammable hydrogen gas versus inert helium gas). In the same manner, each interface atom has its own unique properties, such as the dimensions of a hero image, or the font-size of a primary heading. These properties directly influence when they're applied to the user interface.

In addition to the tags that make up our user interfaces, atoms can also include more abstract elemental items like color palettes, font stacks, and even invisible things like animations. Defining these elemental properties of our UIs help promote consistency and cohesion throughout the entire experience.

{% include figure.html src="../images/content/styleguide-salesforce-colors.png" caption="The style guide for Salesforce1 defines the color palette used throughout the user interface of the application." %}

In the context of a style guide, atoms demonstrate all your global styles at a glance, which serves as a helpful reference to keep coming back to. But like atoms in the natural world, interface atoms aren't found floating around all on their lonesome. The application of these atoms is where things get interesting.

## Molecules
{% include figure.html src="../images/content/atomic-design-molecules.png" caption="" %}

In chemistry, molecules are groups of atoms bonded together, which take on new properties as a result.

In interfaces, molecules are groups of elements that function together as a unit. For example, a form label, search input, and button atom can combine them together to form a search form molecule.

Building up from atoms to molecules encourages a “do one thing and do it well” mentality, and encourages creating reusable interface patterns.

- Molecules definition: a group of atoms joined together to form a relatively simple module. For example, a label, input, and button atom joining together to form a search form molecule.
- Why Molecules: single responsibility principle, assemble rather than deconstruct, testing, etc

## Organisms
{% include figure.html src="../images/content/atomic-design-organisms.png" caption="" %}

Organisms are groups of molecules (and possibly atoms) joined together to form distinct section of an interface.

Organisms can consist of similar and/or disparate molecule types. For example, a masthead organism might consist of a logo, navigation, and search form, while a “product grid” organism might consist of the same product info molecule repeated over and over.

Building up from molecules to organisms encourages creating standalone, portable, reusable components.

- Organisms definition: groups of molecules (and possibly atoms) joined together to form distinct section of an interface.
- Why Organisms: reusable interface components, more concrete than atoms and molecules, encourages portability, etc


## Templates
{% include figure.html src="../images/content/atomic-design-templates.png" caption="" %}

With templates, we break our biochemistry analogy to get into language that makes more sense to clients and final output. Templates are composed mostly of organisms combined together to form page-level objects.

Templates provide context for these relatively abstract molecules and organisms, which is helpful for designers and clients alike.

Templates mostly focus on content structure (such as character length, image size, etc) rather than the actual content.

- Breaking the chemistry analogy to get into the deliverables language
- Templates definition: page-level documents that provide context for these relatively abstract molecules and organisms, and  focus on content structure
- Why Templates: focus on content structure, can begin as wireframes and evolve over time, etc

## Pages
{% include figure.html src="../images/content/atomic-design-pages.png" caption="" %}

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
- The Part and the Whole - **Not a linear process** but rather a mental model
- Built in hierarchy
- Shared vocabulary - stakeholders can get on board with the concept
- What's in a name? Discussing the importance of naming ("Modules" "components" "elements" etc)
- Atomic Design in Practice 
- What atomic design isn't - CSS or JS methodology
- Nothing new: why atomic design is different than other things that have been around for a long time.

## Conclusion
- Recap of the the atomic design methodology and its advantages



http://china.org.cn/china/2015-03/17/content_35077927.htm
