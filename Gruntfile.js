module.exports = function(grunt) {

    // Configuration
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        
		jekyll: {
		    serve: {
			    options: {
			      serve: true,
			      port: 4000
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
	grunt.loadNpmTasks('grunt-shell');
	grunt.loadNpmTasks('grunt-serve');
	grunt.loadNpmTasks('grunt-jekyll');


	// Tasks
	grunt.registerTask('serve', ['watch', 'jekyll']);
	grunt.registerTask('default', ['sass', 'watch', 'autoprefixer', 'jekyll:serve']);
};
