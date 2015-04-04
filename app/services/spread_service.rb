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

  private

  # update propgation for the entity that has been spread
  # based on the entity spreading it

  def update_propagation(spread)
    spreadable = spread.spreadable
    spread_publishable = spread.spread_publishable

    propagation = spreadable.propagation
    locations = propagation.locations

    # associate the location of the person who spread it with post through post's propagations
    l = locations.new(spread_publishable.location.attributes.symbolize_keys.slice(:latitude, :longitude, :address))
    l.save(validate: false) # we do not want reverse_geocode to run since we already have all the details
    
    # after the create get the last two locations to update the propagation distance
    last_two_locations = locations.reload.last(2)
    if(last_two_locations[1])
      t = propagation.total
      t += last_two_locations[1].distance_from(last_two_locations[0], :km)
      propagation.update(total: t)
    end
  end

end