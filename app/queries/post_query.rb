class PostQuery
  attr_accessor :posts

  def initialize(posts = Post.all)
    @posts = posts.extending(Scopes)
  end

  module Scopes
    def eager_load
      Post.includes(:postable, :post_publishable, :views, :spreads, :contains, propagation: :locations)
    end
  end
end
