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

  def self.categories
    types = {
      standard: {
        label: 'Standard'
      },
      event: {
        label: 'Event'
      },
      news: {
        label: 'News'
      },
      question: {
        label: 'Question'
      },
      nsfw: {
        label: 'NSFW'
      }
    }
    OpenStruct.new(types)
  end
  validates :category, inclusion: { in: self.categories.to_h.stringify_keys.keys, message: "%{value} is not a valid post category." }, presence: true
end
