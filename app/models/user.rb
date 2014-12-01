class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
end
