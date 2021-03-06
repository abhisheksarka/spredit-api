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
             :display_address,
             :address, 
             :encrypted_id,
             :life,
             :new_comments_count,
             :new_spreads_count,
             :new_contains_count,
             :poster_gender

  has_one :postable, 
          :propagation

  def total_propagation
    object.propagation.total.round(1) rescue 0
  end

  def encrypted_id
    object.encrypted_id
  end

  def display_address
    object.propagation.location.display_address rescue nil
  end

  def address
    object.propagation.location.address rescue nil
  end

  def poster_gender
    object.post_publishable.gender
  end

  def new_comments_count
    0 
  end

  def new_spreads_count
    0 
  end

  def new_contains_count
    0 
  end
end