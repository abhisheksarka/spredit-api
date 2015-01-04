class Location < ActiveRecord::Base
  belongs_to :locatable, polymorphic: true
  
  validates :longitude, presence: true
  validates :latitude, presence: true
end
