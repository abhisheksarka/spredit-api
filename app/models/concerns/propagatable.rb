module Propagatable
  extend ActiveSupport::Concern

  included do
    has_one :propagation, as: :propagatable
    before_create :pr_set_default_propagation
    before_create :pr_set_initial_location
  end

  def derived_location
    pr_location_through_association.location
  end

  private

  def pr_set_default_propagation
    self.build_propagation(total: 0)
  end

  def pr_set_initial_location
    propagation.locations.build(derived_location.attributes.symbolize_keys.slice(:latitude, :longitude, :address))
  end

  def pr_location_through_association
    self.send(self.class.instance_variable_get(:@pr_location_through_association))
  end

  module ClassMethods
    def pr_location_through(association)
      @pr_location_through_association = association
    end
  end
end
