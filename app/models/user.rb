class User < ActiveRecord::Base
  include FbAuthable
  include JwtAuthable
  include Locatable
  lc_location_configurable true

  include PostPublishable
  include SpreadPublishable
end
