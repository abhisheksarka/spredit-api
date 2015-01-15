class SpreadService
  attr_accessor :spread_publishable,
                :spreadable_params

  def initialize(spread_publishable, spreadable_params)
    @spread_publishable = spread_publishable
    @spreadable_params = spreadable_params
  end

  def create
    spread_publishable.spreads.create(spreadable_params)
  end

end