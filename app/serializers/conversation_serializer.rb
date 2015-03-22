class ConversationSerializer < ApplicationSerializer
  attributes :id, 
             :title, 
             :category_id, 
             :category, 
             :conversable_id, 
             :conversable_type,
             :conversable

  def category
    object.category
  end

  def conversable
    object.conversable
  end
end