class UserSerializer < ApplicationSerializer
  attributes :id, 
             :provider, 
             :name,
             :uid,
             :email,
             :gender,
             :profile_picture
end