#Boson

Basically, boson is a particle that "gives" mass to another particles.

But, how?

  > The presence of this field explains why some fundamental particles have mass while the symmetries controlling their interactions should require them to be massless, and why the weak force has a much shorter range than the electromagnetic force. - **[Wikipedia] (http://en.wikipedia.org/wiki/Higgs_boson)**
  
  > Higgs Bosons give other particles mass via the Higgs mechanism. - **[Wikipedia] (http://en.wikipedia.org/wiki/Boson)**

Let's think that Higgs Field for us is our CSS, and particles (HTML content) will gain mass (CSS visual attributes).

Boson gives mass, but it is not directly connected with Atoms.

![img_2927 2](https://cloud.githubusercontent.com/assets/6929565/5716758/a4e2fc56-9adb-11e4-90cc-1cd16102a59d.JPG)

First, I created two placeholders classes **%boson-button** and **%boson-button-success**, those two placeholders will give atoms some mass.

    %boson-button {
      padding: 6px 12px;
      display: inline-block;
      border: 1px solid transparent;
      border-radius: 3px;
    }
    
  and
    
    %boson-button-success {
      background: $green;
      border-color: darken($green, 10%);
      color: $white;
      
      &:hover {
        background: lighten($green, 10%);
      }
    }
    
  Just used variables $green and $white that you need to set up the default color. %boson-button-success is just an example, you can use %boson-button-(state = success, danger etc) if you like Bootstrap-like.

Then, I created a atom (.atom-button) that will *@extend* those two placeholders.

    .atom-button {
      @extend %boson-button;
      @extend %boson-button-success;
    }
    
  will be:
  
    .atom-button {
      padding: 6px 12px;
      display: inline-block;
      border: 1px solid $green; (little bit darker)
      border-radius: 3px;
      color: $white;
    }
    
    .atom:hover {
      background: $green; (little bit lighter)
    }

**PS:** Placeholders don't create a class, unless it extended.

#Quarks

Why should we use Quarks?

I used to build something like these
    
    <a href="#" class="atom-button">
      <i class="atom-icon"></i>
      My pretty button
    </a>
    
And physically talking, it's wrong. Atom inside another atom?
  
  > Due to a phenomenon known as color confinement, quarks are never directly observed or found in isolation - **[Wikipedia] (http://en.wikipedia.org/wiki/Quark)**
  
Soon , I will never use quarks out of an atom.

The code should be:
    
    <a href="#" class="atom-button">
      <i class="quark-icon"></i>
      My pretty button
    </a>
