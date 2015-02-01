class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :address, presence: true
  
  reverse_geocoded_by :latitude, :longitude
  before_validation :reverse_geocode, if: (:longitude_changed? or :latitude_changed?)

  def country
    splitted_address[-1]
  end

  def state
    splitted_address[-2]
  end

  def city
    splitted_address[-3]
  end

  def locality
    splitted_address[-4]
  end

  def display_address
    arr = [state, country]
    arr.unshift(locality) if locality.present?
    arr.join(',').strip
  end

  class << self
    def in_miles(km)
      km * 0.621371
    end
  end

  private

  def splitted_address
    self.address.split(',') rescue [ ]
  end
end
