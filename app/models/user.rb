class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
  
  has_many :conversations, :as => :conversable
end
