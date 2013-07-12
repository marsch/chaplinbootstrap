
requirejs.config({
    baseUrl: './js',
    paths: {
        depend: 'lib/require-depend',
        text: 'vendor/requirehogan/text',
        hgn: 'vendor/requirehogan/hgn',
        cs: 'vendor/requirecs/cs',
        css: 'vendor/requirecss/css',
        less: 'vendor/requireless/less',
        lessc: 'vendor/requireless/lessc',
        'lessc-server': 'vendor/requireless/lessc-server',
        'less-builder': 'vendor/requireless/less-builder',
        'css/css-builder': 'vendor/requirecss/css-builder',
        'css/normalize': 'vendor/requirecss/normalize',
        normalize: 'vendor/requirecss/normalize',
        'coffee-script': 'vendor/requirecs/coffee-script',
        hogan: 'vendor/requirehogan/hogan',
        chaplin: 'vendor/chaplin/chaplin',
        underscore: 'vendor/underscore/underscore',
        jquery: 'vendor/jquery/jquery',
        backbone: 'vendor/backbone/backbone',
        loglevel: 'vendor/loglevel/loglevel',

        // jquery plugins
        'bootstrap.modal': 'vendor/bootstrap/bootstrap-modal',
        'bootstrap.collapse': 'vendor/bootstrap/bootstrap-collapse',
        'bootstrap.dropdown': 'vendor/bootstrap/bootstrap-dropdown'



    },
    shim: {
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        underscore: {
            exports: '_'
        },
        'backbone.stickit': {
            deps: ['backbone']
        },
        'bootstrap.modal': {
            deps: ['jquery']
        },
        'bootstrap.collapse': {
            deps: ['jquery']
        },
        'bootstrap.dropdown': {
            deps: ['jquery']
        },
    }
});

requirejs([
    'cs!app',
    'cs!config',
    'loglevel',
    'less!../css/main'
    ], function (Application, config, log) {
  'use strict';


  var app;

  try {
    // use 'silent' to supress log messages
    // never use console.log directly PLZ
    log.setLevel(config.dev.loglevel);
  } catch (e) {
    // no console.log available
  }

  app = new Application();
  app.initialize();

});



