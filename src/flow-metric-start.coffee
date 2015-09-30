ReturnValue = require 'nanocyte-component-return-value'

class FlowMetricStart extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = FlowMetricStart
