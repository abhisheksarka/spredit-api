class Conversation < ActiveRecord::Base
  belongs_to :conversable, polymorphic: true
  belongs_to :category

  validates :title, :presence => true
  validates :category_id, :presence => true
end
