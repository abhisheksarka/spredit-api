class PostSerializer < ApplicationSerializer
  attributes :id, 
             :postable_id,
             :postable_type,
             :created_at,
             :comments_count,
             :spreads_count,
             :contains_count,
             :total_propagation,
             :views_count,
             :contains_count,
             :content,
             :title,
             :display_address,
             :address

  has_one :postable, 
          :propagation

  def total_propagation
    object.propagation.total.round(1) rescue 0
  end

  def display_address
    object.propagation.location.display_address rescue nil
  end

  def address
    object.propagation.location.address rescue nil
  end
end