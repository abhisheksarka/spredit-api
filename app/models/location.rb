class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true

  validates :longitude, presence: true
  validates :latitude, presence: true

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode, if: (:longitude_changed? or :latitude_changed?)
end
