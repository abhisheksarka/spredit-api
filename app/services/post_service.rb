class PostService
  attr_accessor :post_params,
                :postable_params,
                :post_publishable,
                :post

  def initialize(post_publishable, post_params, postable_params, auto_spread=true)
    @post_publishable = post_publishable
    @post_params = post_params
    @postable_params = postable_params
    @auto_spread = auto_spread
  end

  def create
    # create the entities
    postable = new_postable
    post = new_post
    
    # create associations
    post.postable = postable
    post.post_publishable = post_publishable
    
    # save and return
    post.save
    
    # create the spread object
    spread(post) if @auto_spread and post.valid?

    post.reload
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

  def new_postable
    postable_klass.new(postable_params)
  end

  def new_post
    Post.new(post_params)
  end

  def postable_klass
    post_params[:postable_type].constantize
  end

end