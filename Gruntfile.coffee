module.exports = (grunt) ->
  # load all grunt tasks
  (require 'grunt-task-loader')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      build: ['assets/js', 'assets/css']

    webpack:
      options: require './assets-src/webpack.config.coffee'
      theme:
        foo: 1

    browserSync:
      theme:
        bsFiles:
          src: [
            'assets/**'
            '**/*.php'
          ]

  # Task aliases

  # Development Tasks
  grunt.registerTask 'build', ['clean:build', 'webpack']  # just start the server
  grunt.registerTask 'dev', ['build', 'browserSync']   # build and start watching

