define [], () ->
  'use strict'

  routes = (match) ->
    match '', 'home#show'


  return routes

