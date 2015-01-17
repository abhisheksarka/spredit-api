class SpreadQuery
  attr_accessor :spreads

  def initialize(spreads = Spread.all)
    @spreads = spreads.extending(Scopes)
  end

  module Scopes
    def load_spreadable(with=[])
      includes(spreadable: with)
    end

    def load_spread_publishable(with=[])
      includes(spread_publishable: with)
    end
  end
end
