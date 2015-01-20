class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :address, presence: true
  
  reverse_geocoded_by :latitude, :longitude
  before_validation :reverse_geocode, if: (:longitude_changed? or :latitude_changed?)

  class << self
    def in_miles(km)
      km * 0.621371
    end
  end
end
