class PostBySelfSerializer < PostSerializer
  has_one :postable, 
          :propagation,
          :post_publishable
end