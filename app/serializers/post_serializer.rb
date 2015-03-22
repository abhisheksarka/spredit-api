class PostSerializer < ApplicationSerializer
  attributes :id, 
             :postable_id,
             :postable_type,
             :created_at,
             :comments_count,
             :spreads_count,
             :contains_count,
             :total_propagation,
             :view_count,
             :contains_count,
             :content,
             :display_address,
             :address

  has_one :postable, 
          :propagation

  def comments_count
    object.comments.count
  end

  def spreads_count
    object.spreads.count
  end

  def contains_count
    object.contains.count
  end

  def total_propagation
    object.propagation.total.round(1) rescue 0
  end

  def view_count
    object.views.count
  end

  def display_address
    object.propagation.location.display_address rescue nil
  end

  def address
    object.propagation.location.address rescue nil
  end
end