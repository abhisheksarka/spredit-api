class UserDetailsSerializer < ApplicationSerializer
  attributes :id, 
             :provider, 
             :name,
             :uid,
             :email,
             :gender,
             :profile_picture,
             :profile_picture_medium
  has_one :location
  has_one :location_configuration
end