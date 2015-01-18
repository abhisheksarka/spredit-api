class PostSerializer < BaseSerializer
  attributes :id, 
             :postable_id,
             :postable_type,
             :post_publishable_id,
             :post_publishable_type,
             :created_at
  has_one :postable, 
          :post_publishable, 
          :propagation
end