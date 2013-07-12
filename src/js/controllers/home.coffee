define [
  'cs!controllers/base/page'
  'loglevel'
], (PageBaseController, log) ->

  'use strict'

  class HomeController extends PageBaseController

    show: () ->
      log.info 'HomeController:show'

