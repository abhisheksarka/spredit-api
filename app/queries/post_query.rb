class PostQuery
  attr_accessor :posts

  def initialize(posts = Post.all)
    @posts = posts.extending(Scopes)
  end

  module Scopes
    def near_to(user, types)
      where(id: SpreadQuery.new.spreads.near_to(user).map(&:spreadable_id))
      .where(category: types)
      .where('life > 0')
      .order('life DESC').uniq
    end

    def belongs_to(post_publishable)
      eager_load.where(post_publishable_id: post_publishable.id).order(created_at: :desc)
    end

    def with_pagination(page, per_page=15)
      paginate(page: page, per_page: per_page)
    end

    private

    def eager_load
      includes(:postable, :post_publishable, :views, :spreads, :contains, propagation: :locations)
    end
  end
end
