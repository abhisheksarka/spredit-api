module Locatable
  extend ActiveSupport::Concern

  included do
    has_many :locations, as: :locatable
    has_one :location, -> { order id: :desc }, class_name: 'Location', foreign_key: :locatable_id
    has_one :location_configuration, as: :configurable_location, class_name: 'Configuration::Location'

    before_create :lc_set_default_location_configuration
  end

  def self.lc_with_location_configuration(required)
    @lc_required = required
  end

  def lc_set_default_location_configuration
    return if not self.class.instance_variable_get(:@lc_location_configurable)
    self.location_configuration = Configuration::Location.new({ radius: 15 })
  end

  module ClassMethods
    def lc_location_configurable(configurable)
      @lc_location_configurable = configurable
    end
  end
end
