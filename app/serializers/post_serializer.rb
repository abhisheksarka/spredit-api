class PostSerializer < BaseSerializer
  attributes :id, 
             :postable_id,
             :postable_type,
             :post_publishable_id,
             :post_publishable_type,
             :created_at,
             :comments_count,
             :spreads_count,
             :total_propagation

  has_one :postable, 
          :post_publishable, 
          :propagation

  def comments_count
    object.comments.count
  end

  def spreads_count
    object.spreads.count
  end

  def total_propagation
    object.propagation.total.round(1) rescue 0
  end
end