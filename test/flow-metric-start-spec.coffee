ReturnValue = require 'nanocyte-component-return-value'
FlowMetricStart = require '../src/flow-metric-start'

describe 'FlowMetricStart', ->
  beforeEach ->
    @sut = new FlowMetricStart

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
