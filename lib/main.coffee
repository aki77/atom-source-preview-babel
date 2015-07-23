BabelProvider = require './babel-provider'

module.exports =

  activate: ->
    @babelProvider = new BabelProvider

  deactivate: ->
    @babelProvider = null

  provide: ->
    @babelProvider
