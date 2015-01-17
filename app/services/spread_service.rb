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
      .joins("INNER JOIN locations ON (posts.id = locations.locatable_id AND locations.locatable_type = 'Post')")
      .where('locations.id' => nearby_locations)
      .load_spreadable([:postable, :location, :post_publishable])
  end

end