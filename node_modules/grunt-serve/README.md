# grunt-serve

> Starts a http server that can be called to run Grunt tasks and serve files.

## Getting Started
This plugin requires Grunt `~0.4.0`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started)
guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once
you're familiar with that process, you may install this plugin with this command:

```shell
npm install grunt-serve --save-dev
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('grunt-serve');
```

## The "serve" task

### Overview

This task allows you to create a http server that can be called to run Grunt tasks and serve files.

Once the task is ran, The HTTP server can be accessed by loading the page `http://localhost:9000/`.
This will show you your configured aliases as well as the files that can be access using this server.

Here is a summary of how the server will behave:
 * Calls to / will display a page with some information (configures aliases, files that can be served, directory browsing, ...).
 * Calls to /task/{task1},{task2}/{output} will run the given tasks and return the file named output (see example later).
 * Calls to /{alias} ({alias} being an alias that you have configured) will run the tasks defined for that alias.
 * Calls did not match the rules above will try to return the content of a file for the given path (/index.html will return the file index.html located in the folder where grunt was launched).
 
This project can also be found on `https://www.npmjs.org/package/grunt-serve`.

#### Rebuild on browser refresh

One possible usage of the plugin is triggering automatic build when you refresh a page in your browser.
When developing a web project that uses a lot of JavaScript, you will find yourself losing lots of time switching
to the command line, building the script, switching back to the browser, then pressing refresh to see the result.
This plugin allows you to avoid switching to the command line. You simply need to replace the script in your html
page by the local server that this task creates. Next time you refresh, the browser will call this local server
that will run the grunt tasks you defined and will return the generated file.

An easy way to setup this would be as follow:

```html
	<!doctype html>
	<html>
		<head>
			<title>My Website</title>
			{{ if development }}
				<!-- regenerated files -->
				<link href="http://localhost:9000/client.css" rel="stylesheet" type="text/css" />
				<script src="http://localhost:9000/client.js"></script>
			{{ else if (production) }}
				<!-- static files -->
				<link href="client.css" rel="stylesheet" type="text/css" />
				<script src="client.js"></script>
			{{ endif }}
		</head>
		<body>
			<!-- page content -->
		</body>
	</html>
```

### Options

#### options.port
Type: `Integer`  
Default value: `9000`

The port that the server should be running on.

#### options.aliases
Type: `Object`  
Default value: `null`

Aliases allows you to configure what tasks should be ran and what file should
be returned for a specific path. In the following example, calling http://localhost:9000/client.js
will trigger running the tasks 'html2js', 'concat' and 'minify'. When all the tasks have been executed
the file client.min.js will be returned and the content type 'text/javascript' will be set in the 
headers. If no contentType if given, it will try to auto detect by looking at the output. If no output
if given, the grunt stdout will be returned.

```javascript
	'aliases': {
		'client.js': {
			tasks: ['html2js', 'concat', 'minify'], // required
			output: 'client.min.js', // optional
			contentType: 'text/javascript' // optional
		},
		...
	}
```

#### options.silently
Type: `Boolean`  
Default value: `false`

Controls whether or not to print the build logs in the terminal.

#### options.serve
Type: `Object`  
Default value: `null`

Configuration of serve. The only thing configurable right now is the base path to serve. By default, if no path is specified,
it will automatically serve the files in the grunt working directory. If you want another path to be served, you can either
put a relative or absolute path as shown below. This will only affect the serve feature (aliases or /task output path will
always be related to the grunt working directory). 

```javascript
	'serve': {
		'path': '/Users/user/Documents/workspace/project'
	}
```

### Usage Examples

#### Basic Use - Running tasks with zero configuration

In this example, `grunt serve` will start a web server at `http://localhost:9000/`. Any call to /task will trigger a build as described below.
 * If you go to http://localhost:9000/task/html2js,concat/client.js it will execute the tasks 'html2js' and 'concat' and return the content of the file 'client.js'.
 * If you go to http://localhost:9000/task/cssmin/client.css it will execute the task 'cssmin' and return the content of the file 'client.css'.
 * If you go to http://localhost:9000/task/concat it will execute the task 'concat' and return the stdout and stderr that grunt outputed.

```javascript
// Project configuration.
grunt.initConfig({
	serve: {
		options: {
			port: 9000
		}
	}
});
```

#### Using Aliases

In this example, `grunt serve` will start a web server at `http://localhost:9000/`.
 * If you go to http://localhost:9000/client.js it will execute the tasks 'html2js' and 'concat' and return the content of the file 'client.js'.

```javascript
// Project configuration.
grunt.initConfig({
	serve: {
		options: {
			port: 9000,
			'client.js': {
				tasks: ['html2js', 'concat'],
				output: 'client.js'
			}
		}
	}
});
```

#### Output logs

In this example, `grunt serve` will start a web server at `http://localhost:9000/`.
 * If you go to http://localhost:9000/client.js it will execute the tasks 'html2js' and 'concat' and return the stdout and stderr
that were outputed by grunt while running those tasks.

```javascript
// Project configuration.
grunt.initConfig({
	serve: {
		options: {
			port: 9000,
			'client.js': {
				tasks: ['html2js', 'concat'],
				output: 'stdout'
			}
		}
	}
});
```

#### Serve files

In this example, `grunt serve` will start a web server at `http://localhost:9000/`.

If you are a request did not match any alias, the server will try to find a file matching the request path.
For example if you load `http://localhost:9000/pages/index.html` (and no alias for 'pages/index.html' was configured)
the server check if the file "pages/index.html" exists. If it does, it will return it. Otherwise it will return a 
404 Not found page.

```javascript
// Project configuration.
grunt.initConfig({
	serve: {
		options: {
			port: 9000
		}
	}
});
```

## Release History

 * 2014-03-23   0.1.0    First Release
 * 2014-03-23   0.1.1    Minor improvements
 * 2014-03-24   0.1.2    Documentation changes
 * 2014-03-24   0.1.3    Improved URL parsing
 * 2014-09-16   0.1.4    Fixed unresponsive server issue
 * 2014-09-27   0.1.5    Added serves files and nicer pages
 * 2014-09-27   0.1.6    Bug fix and code refactoring.
