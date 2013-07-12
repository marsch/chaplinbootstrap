'use strict'

lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet
mountFolder = (connect, dir) ->
  return connect.static(require('path').resolve(dir));

module.exports = (grunt) ->
  _ = grunt.util._
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
  pkg = require './package.json'

  SRC_DIR = 'src'
  OUT_DIR = 'build'
  BOWER_DIRECTORY = SRC_DIR

  grunt.initConfig

    watch:
      livereload:
        files: [
          SRC_DIR + '/**/*.{mustache,html,css,less,js,coffee,png,jpg,jpeg,gif,webp}'
        ]
        tasks: ['livereload']

    connect:
      options:
        port: 9001
        hostname: 'localhost'

      livereload:
        options:
          middleware: (connect) ->
            [lrSnippet, mountFolder(connect, SRC_DIR + '/')]

    open:
      server:
        path: 'http://localhost:<%= connect.options.port %>'

    clean:
      bower: 'components'

    bower:
      install:
        options:
          targetDir: BOWER_DIRECTORY
          cleanup: false
          install: true

    requirejs:
      compile_app:
        options:
          name: 'main'
          out: OUT_DIR + '/js/main.min.js'
          include: _(grunt.file.expandMapping(['app*', 'controllers/**/*'], ''
            cwd: SRC_DIR
            rename: (base, path) -> path.replace /\.coffee$/, ''
          )).pluck 'dest'
          mainConfigFile: SRC_DIR + '/js/main.js'
          baseUrl: './' + SRC_DIR + '/js'
          keepBuildDir: true
          almond: true
          insertRequire: ['main']
          optimize: 'none'

  grunt.renameTask('regarde', 'watch')

  grunt.registerTask 'server', (target) ->
    grunt.task.run [
      'livereload-start'
      'connect:livereload'
      'open:server'
      'watch:livereload'
    ]

  grunt.registerTask 'prepare', [
    'bower:install'
    'clean'
  ]

  # TODO: need to copy images and html and other assets to OUT_DIR
  grunt.registerTask 'build', [
    'requirejs'
  ]

  grunt.registerTask 'all', [
    'prepare'
    'build'
    'server'
  ]
