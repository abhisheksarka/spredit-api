class Post < ActiveRecord::Base
  include Spreadable
  include Commentable
  include Propagatable
  pr_location_through :post_publishable

  belongs_to :postable, polymorphic: true
  belongs_to :post_publishable, polymorphic: true

end
