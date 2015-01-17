class UserDetailsSerializer < BaseSerializer
  attributes :id, 
             :provider, 
             :name,
             :uid,
             :email,
             :gender,
             :profile_picture
  has_one :location
  has_one :location_configuration
end