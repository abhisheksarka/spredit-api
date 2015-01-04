class UserSerializer < BaseSerializer
  attributes :id, 
             :provider, 
             :name,
             :uid,
             :email,
             :gender
  has_one :location
end