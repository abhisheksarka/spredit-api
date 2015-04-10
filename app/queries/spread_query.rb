class SpreadQuery
  attr_accessor :spreads

  def initialize(spreads = Spread.all)
    @spreads = spreads.extending(Scopes)
  end

  module Scopes
    def load_spreadable(with=[])
      includes(spreadable: with)
    end

    def near_to(user)
      join_posts(user)
      .join_propagation
      .join_locations
      .where
      .not('spreads.spreadable_id' => existing_spreadables(user))
      .where('locations.id' => nearby_locations(user).map(&:id))
      .includes(spreadable: [:postable, :post_publishable, propagation: :locations])
      .uniq
    end

    protected

    def existing_spreadables(user)
      Spread.where(spread_publishable_id: user.id).pluck(:spreadable_id)
    end

    def nearby_locations(user)
      user.location.nearbys(Location.in_miles(user.location_configuration.radius))
    end

    def join_posts(user)
      joins("INNER JOIN posts ON " + 
        "(" +
          "(spreads.spreadable_id = posts.id AND spreads.spreadable_type = 'Post' AND spreads.action = 'spread') AND " +
          "(posts.post_publishable_id != " + user.id.to_s + " AND posts.post_publishable_type = 'User')" +
        ")"
      )
    end

    def join_propagation
      joins("INNER JOIN propagations ON " +
        "(" + 
          "(posts.id = propagations.propagatable_id AND propagations.propagatable_type = 'Post')" +
        ")"
      )
    end

    def join_locations
      joins("INNER JOIN locations ON " +
        "(" +
          "(propagations.id = locations.locatable_id AND locations.locatable_type = 'Propagation')" +
        ")"
      )
    end
  end
end
