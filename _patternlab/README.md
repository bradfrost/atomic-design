# Pattern Lab Development Edition

The Development Edition of Pattern Lab gives the core team the ability to work on and commit changes to the latest editions of select packages while running each package within the overall Pattern Lab environment. This edition is NOT stable.

## Installing the Development Edition

Pattern Lab uses [Composer](https://getcomposer.org/) to manage project dependencies. If you are going to use the Development Edition you should have Composer installed. 

### 1. Install Composer 

To install Composer type the following two lines in the command line:

    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer

Then close and re-open your command line terminal.

### 2. Install the Development Edition

Use Composer's `create-project` feature to install the Development Edition into a location of your choosing. Type:

    cd install/location/
    composer create-project pattern-lab/edition-development your-project-name

**Important:** When asked `Do you want to remove the existing VCS (.git, .svn..) history?` answer `n`.

This will create a directory called `your-project-name`. It will also install Pattern Lab's default folder structure as well as core, its dependencies, and the select packages as separate Git clones.

### 3. Update Git Remotes

Due to an issue with Composer the default `remote` values for the `dev` branches are set to the wrong locations. This will cause issues if/when you try to push your changes. To update them you must type:

    git config branch.dev.remote origin

for each package. The list of packages included in the Development Edition and their locations are:

    pattern-lab/core -> vendor/pattern-lab/core/
    pattern-lab/unified-asset-installer -> vendor/pattern-lab/unified-asset-installer
    pattern-lab/patternengine-mustache -> packages/pattern-lab/patternengine-mustache
    pattern-lab/starterkit-mustache-default -> packages/pattern-lab/starterkit-mustache-default
    pattern-lab/styleguidekit-assets-default -> packages/pattern-lab/styleguidekit-assets-default
    pattern-lab/styleguidekit-mustache-default -> packages/pattern-lab/styleguidekit-mustache-default

If you add another Pattern Lab package (e.g. plug-in, StarterKit, etc.) you must also make sure to update the origin for its `dev` branch.

### 4. Run Generate

To generate Pattern Lab for the first time and make sure everything was installed correctly type:

    php core/console --generate

To list all available commands type:

    php core/console --help

## Adding a New Package

To add a new package to your version of the Development Edition type:

    composer require package-name/from-packagist

Composer uses [Packagist](http://packagist.com) as the repository of [all Pattern Lab-related packages](https://packagist.org/packages/pattern-lab/) from the core Pattern Lab team.

## Forking and Testing a Package

To use the Development Edition to test changes you may have made to a fork of a package do the following:

### 1. Fork a Package and Create a Feature Test Branch

On GitHub you can fork the package you want to modify. You must create a new branch in which you will create your new changes. In this example we will use `pattern-lab/patternengine-mustache` as the example of our forked project and `bugfix` as the name of our branch.

### 2. Update the Repositories Section of `composer.json`

In `composer.json` you need to add or update the `repositories` section to point at your forked repository for a package:

    "repositories": [
        {
            "type": "vcs",
            "url": "https://github.com/your-name/patternengine-php-mustache"
        }
    ],

### 3. Update the Package Branch in Require Section of `composer.json`

In `composer.json` you need to update the `require` section to point at the new branch in your forked repository:

    "require": {
        "pattern-lab/patternengine-mustache": "dev-bugfix"
    }

**Reminder:** `dev-` is used by Composer to know when it should clone a branch in a repo instead of downloading it. `dev-` should not he a part of the name of your branch.

### 4. Update the Development Edition's Dependencies

To update the Development Edition's dependencies to use your forked package type:

    composer update pattern-lab/patternengine-mustache

## Testing Against "Releases"

Packages developed by the core Pattern Lab team use the [gitflow model](http://nvie.com/posts/a-successful-git-branching-model/) of Git repository management. Because the Development Edition clones the repos for each package you can technically switch each package to use the `master` branch to test against the last release of any particular package. 
