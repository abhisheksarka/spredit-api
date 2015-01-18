class SpreadService
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def create(spreadable_params)
    user.spreads.create(spreadable_params)
  end

  def query
    nearby_locations = user.location.nearbys(Location.in_miles(user.location_configuration.radius)).map(&:id)
    SpreadQuery.new
      .spreads
      .joins("INNER JOIN posts ON (spreads.spreadable_id = posts.id AND spreads.spreadable_type = 'Post')")
      .joins("INNER JOIN propagations ON (posts.id = propagations.propagatable_id AND propagations.propagatable_type = 'Post')")
      .joins("INNER JOIN locations ON (propagations.id = locations.locatable_id AND locations.locatable_type = 'Propagation')")
      .where('locations.id' => nearby_locations)
      .load_spreadable([:postable, :post_publishable, propagation: :locations])

      
      # .where.not('spreads.spread_publishable_id' => user.id)
  end

end