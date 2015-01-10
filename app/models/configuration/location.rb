class Configuration::Location < ActiveRecord::Base
  belongs_to :configurable_location, polymorphic: true

  validates :radius, presence: true
  validates :radius, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 30 }
  
end
