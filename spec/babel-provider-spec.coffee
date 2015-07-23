path = require 'path'
fs = require 'fs'
BabelProvider = require '../lib/babel-provider'

describe "SourcePreviewReact", ->
  [provider, es6Code, jsCode] = []

  beforeEach ->
    provider = new BabelProvider
    es6Code = fs.readFileSync(path.join(__dirname, 'fixtures', 'sample.es6'), encoding: 'utf8')
    jsCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'sample.js'), encoding: 'utf8')

  describe "transform", ->
    it "es6 to js", ->
      result = provider.transform(es6Code)
      expect(result.code.trim()).toEqual(jsCode.trim())
      expect(result.sourceMap).toBeNull()

    it "jsx to js with sourceMap", ->
      result = provider.transform(es6Code, sourceMap: true)
      expect(result.code.trim()).toEqual(jsCode.trim())
      expect(result.sourceMap).not.toBeNull()
      expect(result.sourceMap.sources).toHaveLength(1)
