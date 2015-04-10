module LocationConfigurable
  extend ActiveSupport::Concern

  included do
    has_one :location_configuration, as: :configurable_location, class_name: 'Configuration::Location'
    before_create :lc_set_default_location_configuration
  end

  def lc_set_default_location_configuration
    self.location_configuration = Configuration::Location.new({ radius: 30 })
  end

  module ClassMethods
  
  end
end
