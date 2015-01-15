class SpreadQuery
  def initialize(relation = Spread.all)
    @relation = relation.extending(Scopes)
  end

  def find
    
  end


  module Scopes
  end
end
