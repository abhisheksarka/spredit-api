class Conversation < ActiveRecord::Base
  belongs_to :conversable, polymorphic: true
  has_one :category

  validates :title, :presence => true
  validates :category, :presence => true
end
