class PostService
  attr_accessor :post_params,
                :postable_params,
                :post_publishable,
                :post

  def initialize(post_publishable)
    @post_publishable = post_publishable
  end

  def create(post_params, auto_spread=true)
    @post_params = post_params
    
    if is_postable_associated_to_an_existing_post?
      post = Post.new
      post.errors[:post] << "already associated to a postable"
      post
    end

    post = post_publishable.posts.create(post_params)
    # create the spread object
    spread(post) if auto_spread and post.valid?
    post
  end

  def query
    Post.includes(:postable, :post_publishable, :views, :spreads, :contains, propagation: :locations)
    .where(id: SpreadService.new(post_publishable).query.map(&:spreadable_id)).uniq
  end

  private

  def spread(post)
    SpreadService.new(post_publishable).create(spread_params(post))
  end

  def spread_params(post)
    {
      spreadable_type: 'Post',
      spreadable_id: post.id,
      action: 'spread'
    }
  end

  def is_postable_associated_to_an_existing_post?
    post_params[:postable_type].constantize.find(post_params[:postable_id]).post.present? rescue false
  end
end