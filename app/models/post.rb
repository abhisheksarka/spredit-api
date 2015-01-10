class Post < ActiveRecord::Base
  include Locatable
  lc_location_configurable false

  belongs_to :postable, polymorphic: true
  belongs_to :post_publishable, polymorphic: true
end
