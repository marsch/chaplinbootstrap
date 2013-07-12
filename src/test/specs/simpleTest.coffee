'use strict'

describe 'test setup', () ->
  it 'should run the tests', () ->
    '1'.should.be.a 'string'
    '1'.should.be.equal '1'
    expect(1).to.be.equal 1

  it 'should find the compiled source and loaded with requirejs', (done) ->
    require ['cs!app'], (Application) ->
      console.log 'what happens?', arguments
      should.exist(Application)
      done()
