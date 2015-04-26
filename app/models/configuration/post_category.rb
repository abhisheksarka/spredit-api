class Configuration::PostCategory < ActiveRecord::Base
  belongs_to :configurable_post_category, polymorphic: true

  validates :values, presence: true
end
