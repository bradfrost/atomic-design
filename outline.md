---
layout: page
title: Outline
permalink: /outline/
---

Atomic Design discusses the importance of crafting robust design systems, and introduces a methodology for which to create smart, deliberate, interface systems.

The book will begin by addressing the "why": why designers should care about thinking about interfaces in a more systematic way. I'll discuss the history of modular design systems (after all, this type of thinking been around for a long while now), but discuss how the ever-shifting Web landscape is making systematic thinking a necessity.

The first section will also discuss the emerging trends and techniques that encourage more systematic thinking: style tiles, element collages, pattern libraries, UI frameworks, and more. And while I'll certainly extol the virtues of these techniques, I'll also bring to light a lot of the shortcomings and frustrations of UI frameworks and pattern libraries. This sets the stage to introduce a more sound, deliberate way of constructing an interface system.

The second chapter will define atomic design. Atomic design is an interface design methodology consisting of five distinct stages:

- Atoms
- Molecules
- Organisms
- Templates
- Pages

The chapter will go on to explain the first three (non-page level) stages of atomic design: atoms, molecules, and organisms. I'll define what each stage is, and discuss the advantages and challenges of each.

Chapter three will dive into the two remaining stages of atomic design: templates and pages. At this level we break the chemistry analogy and transition into language that makes more sense to clients and final output. Templates are webpage-level documents which provide context for these relatively abstract molecules and organisms, and focus on content structure (such as character length, image size, etc) rather than actual representative content.

Pages are the final stage of atomic design. Pages are specific instances of templates and swap out placeholder content with real representative content to give an accurate depiction of what a user will ultimately see. This stage is essential for testing the effectiveness of the design system, and provides a place to test variations in templates (for example demonstrating  an article containing a 40-character-long headline and another article with a 340-character-long headline).

Chapter three will discuss the importance of separating content structure with real representative content. Too often designs are handed off to be integrated only to find out they look like garbage when best-case-scenario FPO content is replaced with the actual content. Or worse, the design is entirely unfeasible. I'll discuss the delicate dance between FPO content and real content, stress testing a design system, and providing much-needed context for atoms, molecules, and organisms.

This chapter will recap the atomic design process, and discuss the merits of constructing both the final product and the underlying system concurrently. Both The Part and The Whole have a place in the design process, and the ability to traverse between abstract and concrete is one of atomic design's biggest advantages. Sometimes you need to see the forest, and sometimes you need to see the trees.

Chapter one explains why. Chapter two and three are about the what. Chapter four is all about how. Chapter four will discuss applying atomic design to the reader's Web design process.

This chapter will discuss tools and techniques to create atomic design systems. I'll introduce Pattern Lab, a tool Dave Olsen and I created in order to execute atomic design systems. I'll explain the gist of using Pattern Lab and its various features, but I want to be cognizant of not focusing too much on this specific tool. While I know it's an effective tool for me and others, I understand that it might not be a perfect fit for all readers. The book is more about promoting the idea of atomic design rather than any specific tool.

I'll introduce techniques for design teams to get started with systematic design. One particularly useful technique is conducting an interface inventory. I'll define what an interface inventory is and how to conduct one. I'll also reference other tools (like Stlyify.me and Nicole Sullivan's Typo-O-Matic) that help deconstruct an existing interface into its component parts. I'll also discuss pattern library tools and resources to help designers kickstart their own design systems.

Everyone's design process is different, so I'll also discuss how to introduce and integrate atomic design into cross-disciplinary Web design teams. I'll also provide practical advice for getting buy-in from colleagues and clients.

The book will conclude by recapping why thinking in a more systematic way is becoming increasingly necessary. I'll talk about the merits of atomic design, and remind people how they can get started. I will leave on a note of "What's next?" for design systems. Right now, for me the most obvious challenge is to make systematic design the default mode of thinking for designers, agencies, and organizations. I think there's a tremendous opportunity for design systems to help people craft more consistency,

## 1. Design systems
- Our paginated past
- The ever-shifting Web landscape and the need for modularity
- History of modular design
- Trends: style tiles, element collages, UI frameworks, pattern libraries, CSS architecture
- Advantages of design systems: promote consistency, establish a consistent vocabulary, create more robust deliverables, establish a system that can be modified and extended, future-friendly
- Issues with UI frameworks and pattern libraries
- Setting the stage for the need of a better methodology

## 2. Atomic Design Methodology
- Set up the chemistry analogy (atoms are the building blocks of matter, those atoms combine to form molecules, etc)
- Definition of atomic design: atoms, molecules, organisms, templates, and pages

### Atoms
- Atoms definition: basic tags and other design elements that can't be broken down any further.
- Atoms pros: establishes a shared vocabulary, see all interface styles abstracted at a glance, etc
- Atoms challenges: too abstract to be useful, etc

### Molecules
- Molecules definition: a group of atoms joined together to form a relatively simple module. For example, a label, input, and button atom joining together to form a search form molecule.
- Molecule pros: do one thing and do it well, assemble rather than deconstruct, etc
- Molecule challenges: Still fairly abstract, out of context, etc

### Organisms
- Organisms definition: groups of molecules (and possibly atoms) joined together to form distinct section of an interface.
- Organism pros: reusable interface components, more concrete than atoms and molecules, encourages portability, etc
- Organism challenges: Still out of context, etc
- Breaking the chemistry analogy to get into the deliverables language

### Templates
- Templates definition: page-level documents that provide context for these relatively abstract molecules and organisms, and  focus on content structure
- Templates pros: focus on content structure, can begin as wireframes and evolve over time, etc
- Templates challenges: still an abstraction. FPO is not real content, etc

### Pages
- Page definition: specific instances of a template. Replaces content structure with real representative content
- Page pros: Tests the resiliency of the system, test variations in content structure, extremely concrete, it's what the client naturally ends up focusing on since it's what
- Page considerations: Clients/colleagues can get distracted by representative content ("I don't like how I look in that photo") vs commenting on effectiveness of the design.
Atomic design summary: recap atoms, molecules, organisms, templates, and pages
Discuss the advantages of atomic design, especially the ability to traverse between abstract and concrete

### Advantages
- Traverse between abstract and concrete. Can simultaneously
- Built in hierarchy

### Atomic Design in Practice
- Not a linear process
- Not a CSS or JS methodology

## 3. Tools of the Trade
- Pattern Lab, what and how
- Getting started
- Interface inventories
- What interface inventories are and why they're effective
- How to conduct an interface inventory
- Stylify.me and Type-o-matic
- Pattern library boilerplates, and front-end style guides
Process & Workflow
Getting buy-in from clients and colleagues
Working with atomic design in cross-disciplinary teams
Conclusion
Recap why systematic design is so important
Recap the advantages of atomic design
Remind the reader how they can get started
## Epilogue
- [Thanks & Acknowledgements](/thanks/)
