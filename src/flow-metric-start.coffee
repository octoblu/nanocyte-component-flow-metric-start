ReturnValue = require 'nanocyte-component-return-value'

class FlowMetricStart extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope

    devices: [config.deviceId]
    payload:
      date: Date.now()
      userUuid: 'userUuid'
      deploymentUuid: config.deploymentUuid
      application: 'flow-runner'
      flowUuid: config.flowUuid
      workflow: 'flow-start'
      state: 'end'

module.exports = FlowMetricStart
