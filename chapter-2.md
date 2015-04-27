---
layout: page
title: Atomic Design Methodology
chapterTitle: Chapter 2
permalink: /chapter-2/
---

The second chapter will define atomic design. Atomic design is an interface design methodology consisting of five distinct stages working together to create deliberate design systems.

- Set up the chemistry analogy (atoms are the building blocks of matter, those atoms combine to form molecules, etc)
- Definition of atomic design: atoms, molecules, organisms, templates, and pages

{% include figure.html src="../images/content/atomic-design-process.png" caption="Atomic design is atoms, molecules, organisms, and pages" %}

## Atoms
{% include figure.html src="../images/content/atomic-design-atoms.png" caption="atoms" %}

In chemistry, atoms are the basic building blocks of matter. They have distinct properties and can't be broken down further without losing their meaning.

Translated to interfaces, atoms are basic tags, such as form labels, inputs or buttons. They also include more abstract elements like color palettes, fonts, and animations.

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

With templates, we break our biochemistry analogy to get into language that makes more sense to clients and final output. Templates are comprised mostly of organisms combined together to form page-level objects.

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
- The Part and the Whole - Not a linear process
- What's in a name? Discussing the importance of naming, and the
- Atomic Design in Practice 
- What atomic design isn't - CSS or JS methodology
- Nothing new: why atomic design is different than other things that have been around for a long time.
- Recap of the the atomic design methodology

[a](http://us5.campaign-archive1.com/?u=7e093c5cf4&id=ead8a72012&e=ecb25a3f93)

http://china.org.cn/china/2015-03/17/content_35077927.htm
