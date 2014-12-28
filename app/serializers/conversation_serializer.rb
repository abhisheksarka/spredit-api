class ConversationSerializer < BaseSerializer
  attributes :id, :title, :category_id, :category

  def category
    object.category
  end
end