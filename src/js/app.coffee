define [
  'cs!config'
  'chaplin'
  'cs!controllers/menu'
  'cs!controllers/footer'
  'loglevel'

  'cs!routes'

], (config, Chaplin, MenuController, FooterController, log, routes ) ->

  'use strict'

  class Application extends Chaplin.Application

    initialize: ->
      window.APP = @
      @initDispatcher controllerSuffix: '', controllerPath: 'cs!controllers/'
      @initLayout()
      @initComposer()
      @initMediator()
      @initControllers()

      # Register all routes and start routing
      @initRouter routes, {root: '/', pushState: false}


      @startRouting()


      # Freeze the object instance; prevent further changes
      Object.freeze? @

    initMediator: ->
      # Attach with semi-globals here.
      Chaplin.mediator.controllerAction = ""
      Chaplin.mediator.actionParams = {}

    initControllers: ->
      new MenuController()
      new FooterController()



  return Application

