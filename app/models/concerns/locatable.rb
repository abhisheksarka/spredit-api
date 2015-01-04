module Locatable
  extend ActiveSupport::Concern

  included do
    has_many :locations, as: :locatable
    has_one :last_location, -> { order id: :desc }, class_name: 'Location', foreign_key: :locatable_id
  end

  module ClassMethods
    
  end
end
