class Post < ActiveRecord::Base
  include Viewable
  include Spreadable
  include Commentable
  include Propagatable
  include Activity::Targetable
  include IdEncryptable

  pr_location_through :post_publishable

  belongs_to :postable, polymorphic: true
  belongs_to :post_publishable, polymorphic: true
  validates_with PostValidator, on: :create
  validates :title, length: { maximum: 120 }
end
