class SpreadService
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def create(spreadable_params)
    s = user.spreads.create(spreadable_params)
    if s.valid? 
      update_propagation(s)
      s.reload
    end
    s
  end

  def query
    nearby_locations = user.location.nearbys(Location.in_miles(user.location_configuration.radius)).map(&:id)
    existing_spreadables = Spread.where(spread_publishable_id: user.id).pluck(:spreadable_id)
    SpreadQuery.new
      .spreads
      .joins("INNER JOIN posts ON " + 
        "(" +
          "(spreads.spreadable_id = posts.id AND spreads.spreadable_type = 'Post' AND spreads.action = 'spread') AND " +
          "(posts.post_publishable_id != " + user.id.to_s + " AND posts.post_publishable_type = 'User')" +
        ")"
      )
      .joins("INNER JOIN propagations ON " +
        "(" + 
          "(posts.id = propagations.propagatable_id AND propagations.propagatable_type = 'Post')" +
        ")"
      )
      .joins("INNER JOIN locations ON " +
        "(" +
          "(propagations.id = locations.locatable_id AND locations.locatable_type = 'Propagation')" +
        ")"
      )
      .where.not(spreadable_id: existing_spreadables)
      .where('locations.id' => nearby_locations)
      .load_spreadable([:postable, :post_publishable, propagation: :locations])
      .uniq
  end

  private

  # update propgation for the entity that has been spread
  # based on the entity spreading it

  def update_propagation(spread)
    spreadable = spread.spreadable
    spread_publishable = spread.spread_publishable

    propagation = spreadable.propagation
    locations = propagation.locations

    # associate the location of the person who spread it with post through post's propagations
    locations.create(spread_publishable.location.attributes.symbolize_keys.slice(:latitude, :longitude, :address))
    # after the create get the last two locations to update the propagation distance
    last_two_locations = locations.reload.last(2)
    if(last_two_locations[1])
      t = propagation.total
      t += last_two_locations[1].distance_from(last_two_locations[0], :km)
      propagation.update(total: t)
    end
  end

  def create_notification
  end

end