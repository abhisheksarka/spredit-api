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
  validates :content, length: { maximum: 250 }

  def self.categories
    [   
      {
        label: 'Standard',
        value: 'standard'
      },
      {
        label: 'Event',
        value: 'event'
      },
      {
        label: 'News',
        value: 'news'
      },
      {
        label: 'Question',
        value: 'question'
      },
      {
        label: 'NSFW',
        value: 'nsfw'
      }
    ]
  end

  def self.default_initial_categories
    self.categories.delete_if { | c | c[:value] == 'nsfw' } 
  end

  validates :category, inclusion: { in: self.categories.map { | c | c[:value] }, message: "%{value} is not a valid post category." }, presence: true
end
