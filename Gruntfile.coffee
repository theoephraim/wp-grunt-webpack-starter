module.exports = (grunt) ->
  # load all grunt tasks
  (require 'grunt-task-loader')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    ###### BUILD
    clean:
      build: ['assets/js', 'assets/css']

    webpack:
      options: require './assets-src/webpack.config.coffee'
      theme:
        foo: 1

    ###### DEVELOPMENT
    watch:

      # livereload tasks
      css:
        files: 'assets/css/*.css'
        spawn: false
        options: { livereload: true }
      js_output:
        files: 'assets/js/*.js'
        spawn: false
        options: { livereload: true }
      images:
        files: 'assets/images/**/*'
        spawn: false
        options: { livereload: true }
      php:
        files: '*.php'
        spawn: false
        options: { livereload: true }

  # Task aliases

  # Development Tasks
  grunt.registerTask 'build', ['clean:build', 'webpack']  # just start the server
  grunt.registerTask 'dev', ['build', 'watch']   # build and start watching

