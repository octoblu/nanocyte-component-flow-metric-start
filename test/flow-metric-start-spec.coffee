ReturnValue = require 'nanocyte-component-return-value'
FlowMetricStart = require '../src/flow-metric-start'

describe 'FlowMetricStart', ->
  beforeEach ->
    @sut = new FlowMetricStart

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      beforeEach ->
        @result = @sut.onEnvelope
          config:
            deviceId: 'some-hardcoded-uuid'
            flowUuid: 'some-flow-uuid'
            deploymentUuid: 'some-deployment-uuid'

      it 'should return a message', ->
        expect(@result).to.deep.equal
          devices: ['some-hardcoded-uuid']
          payload:
            userUuid: 'userUuid'
            deploymentUuid: 'some-deployment-uuid'
            application: 'flow-runner'
            flowUuid: 'some-flow-uuid'
            workflow: 'flow-start'
            state: 'end'

    describe 'when called with another envelope', ->
      beforeEach ->
        @result = @sut.onEnvelope
          config:
            deviceId: 'some-softcoded-uuid'
            flowUuid: 'some-other-flow-uuid'
            deploymentUuid: 'some-other-deployment-uuid'

      it 'should return a message', ->
        expect(@result).to.deep.equal
          devices: ['some-softcoded-uuid']
          payload:
            userUuid: 'userUuid'
            deploymentUuid: 'some-other-deployment-uuid'
            application: 'flow-runner'
            flowUuid: 'some-other-flow-uuid'
            workflow: 'flow-start'
            state: 'end'
