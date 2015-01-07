module Locatable
  extend ActiveSupport::Concern

  included do
    has_many :locations, as: :locatable
    has_one :location, -> { order id: :desc }, class_name: 'Location', foreign_key: :locatable_id
    has_one :location_configuration, as: :configurable_location, class_name: 'Configuration::Location'

    before_create :set_default_location_configuration
  end

  def set_default_location_configuration
    self.location_configuration = Configuration::Location.new({ radius: 15 })
  end

  module ClassMethods
    
  end
end
