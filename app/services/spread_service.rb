class SpreadService
  attr_accessor :user

  def initialize(user, config={})
    @user = user
    @config = config
  end

  def create(spreadable_params)
    @spread = user.spreads.create(spreadable_params)
    if @spread.valid? 
      update_propagation
      update_life
      @spread.reload
    end
    @spread
  end

  private

  def update_life
    return if @config[:no_life_update]

    l = spreadable.life
    if @spread.action == 'spread'
      l = l + 1
      l = 5 if(l > 5)
    else
      l = l - 1
      l = 0 if(l < 0) 
    end
    spreadable.update(life: l)
  end

  # update propgation for the entity that has been spread
  # based on the entity spreading it

  def update_propagation
    return if @config[:no_propagation_update]

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

  def spread_publishable
    @spread_publishable ||= @spread.spread_publishable
  end

  def spreadable
    @spreadable ||= @spread.spreadable
  end
end