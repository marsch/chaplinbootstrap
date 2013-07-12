define [
  'cs!controllers/base/controller'
  'chaplin'
], (BaseController, Chaplin) ->

  'use strict'


  class PageController extends BaseController

    beforeAction: (actionParams, controllerOptions) ->
      Chaplin.mediator.controllerAction = controllerOptions.action
      Chaplin.mediator.actionParams = actionParams
