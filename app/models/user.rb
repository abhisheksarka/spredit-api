class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
  include Locatable
end
