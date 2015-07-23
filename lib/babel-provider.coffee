babel = null

module.exports =
class BabelProvider

  fromGrammarName: 'Babel ES6 Javascript'
  fromScopeName: 'source.js.jsx'
  toScopeName: 'source.js'

  transform: (code, {sourceMap} = {}) ->
    babel ?= require 'babel-core'
    options =
      sourceMaps: sourceMap ? false
    result = babel.transform(code, options)

    {
      code: result.code
      sourceMap: result.map ? null
    }
