# grunt-autoprefixer
[![Build Status](https://travis-ci.org/nDmitry/grunt-autoprefixer.png?branch=master)](https://travis-ci.org/nDmitry/grunt-autoprefixer) 
[![Dependency Status](https://david-dm.org/nDmitry/grunt-autoprefixer.png)](https://david-dm.org/nDmitry/grunt-autoprefixer)
[![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

> [Autoprefixer](https://github.com/ai/autoprefixer) parses CSS and adds vendor-prefixed CSS properties using the [Can I Use](http://caniuse.com/) database.

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-autoprefixer --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-autoprefixer');
```

## The "autoprefixer" task

### Overview
In your project's Gruntfile, add a section named `autoprefixer` to the data object passed into `grunt.initConfig()`.

```js
grunt.initConfig({
  autoprefixer: {
    options: {
      // Task-specific options go here.
    },
    your_target: {
      // Target-specific file lists and/or options go here.
    },
  },
})
```

### Options

#### options.browsers
Type: `Array`
Default value: `['> 1%', 'last 2 versions', 'Firefox ESR', 'Opera 12.1']`

You can specify browsers actual for your project:

```js
options: {
  browsers: ['last 2 version', 'ie 8', 'ie 9']
}
```

[Read more](https://github.com/ai/autoprefixer#browsers).

#### options.cascade
Type: `Boolean`
Default value: `false`

Pass `true` to enable ‘cascade’ indentation. Read more [here](https://github.com/ai/autoprefixer#visual-cascade).

#### options.diff
Type: `Boolean|String`
Default value: `false`

Set it to `true` if you want to get an output patch file:

```js
options: {
  diff: true // or 'custom/path/to/file.css.patch'
}
```
Also you can specify a path where to save this file. More examples in [Gruntfile](https://github.com/nDmitry/grunt-autoprefixer/blob/master/Gruntfile.js).

#### options.map
Type: `Boolean|String|undefined`
Default value: `undefined`

If the map option isn't defined, Autoprefixer will look for source map from a previous compilation step (either inline map or separate one) and update it automatically. Let's say you have `path/file.css` and `path/file.css.map` from SASS, Autoprefixer will find that map, update it and save to a specified destination.

If `true` is specified, Autoprefixer will try to find an input source map file as described above and generate a new map based on the found one (or just generate a new map, unlike the situation when the map option is undefined).

If you keep your map from a pre-processor in another directory (e.g. `path/file.css` and `another-path/file.css.map`), you can specify the path `another-path/` in the map option to point out where grunt-autoprefixer should look for an input map to update it.

Also you can specify `false`. In that case Autoprefixer will not generate or update source map even if there is one from a previous compilation step near an input file or inlined to it (Autoprefixer will delete a map annotation comment from an input file).

You cannot specify a path where to save a map file, it will be saved at the same directory as the output CSS file or inlined to it (check out the option below).

#### options.mapInline
Type: `Boolean|undefined`
Default value: `undefined`

If the option isn't specified, Autoprefixer will inline its map if a map from a previous compilation step was inlined to an input file or save its map as a separate file respectively.

You can specify `true` or `false` to force that behaviour as you like.

### Usage Examples

```js
grunt.initConfig({

  autoprefixer: {

    options: {
      // Task-specific options go here.
    },

    // prefix the specified file
    single_file: {
      options: {
        // Target-specific options go here.
      },
      src: 'src/css/file.css',
      dest: 'dest/css/file.css'
    },

    // prefix all files
    multiple_files: {
      expand: true,
      flatten: true,
      src: 'src/css/*.css', // -> src/css/file1.css, src/css/file2.css
      dest: 'dest/css/' // -> dest/css/file1.css, dest/css/file2.css
    },

    // if you have specified only the `src` param, the destination will be set automatically,
    // so source files will be overwritten
    no_dest: {
      src: 'dest/css/file.css' // globbing is also possible here
    },

    diff: {
        options: {
            diff: true
        },
        src: 'src/css/file.css',
        dest: 'dest/css/file.css' // -> dest/css/file.css, dest/css/file.css.patch
    },

    sourcemap: {
        options: {
            map: true
        },
        src: 'src/css/file.css',
        dest: 'dest/css/file.css' // -> dest/css/file.css, dest/css/file.css.map
    },
  }

});
```

Check out project's [Gruntfile.js](https://github.com/nDmitry/grunt-autoprefixer/blob/master/Gruntfile.js) for more examples.

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).
