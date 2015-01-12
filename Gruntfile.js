module.exports = function(grunt) {

    // Configuration
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        
        connect: {
	      server: {
		      options: {
			      hostname: 'localhost',
			      port: 4000,
			      base: '_site',
			      livereload: true
		      }
	      }
        },
		jekyll: {
		    dist: {
		      options: {
		        config: '_config.yml'
		      }
		    }
		},
		sass: {
			dist: {
				options: {
					style: 'compressed'
				},
				files: {
					'css/style.css': '_sass/style.scss'
				}
			}
		},
		autoprefixer: {
			single_file: {
				src: 'css/style.css',
				dest: 'css/style.css'
			}
        },
		watch: {
			options: {
				livereload: true	
			},
			site: {
				files: ['index.html', '_layouts/*.html','_includes/*.html'],
				tasks: ['jekyll']
			},
			css: {
				files: ['_sass/*.scss', '_sass/**/*.scss'],
				tasks: ['sass', 'autoprefixer', 'jekyll'],
				options: {
					livereload: true	
				}
			}
		}
    });

	// Plugins
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-autoprefixer');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-serve');
	grunt.loadNpmTasks('grunt-jekyll');
	grunt.loadNpmTasks('grunt-contrib-connect');

	grunt.registerTask('serve', ['jekyll','connect:server','watch']);

	// Tasks
	grunt.registerTask('default', ['sass', 'watch', 'autoprefixer', 'connect:server', 'jekyll']);
};
