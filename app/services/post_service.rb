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
    set_default_postable 
    post = post_publishable.posts.new(post_params)
    
    if valid_postable?
      post.save
      # create the spread object
      spread(post) if auto_spread and post.valid?
      post
    else
      post.errors[:an_invalid_postable] << "cannot create a post object"
      post
    end
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

  # default postable is always text 
  # create this automatically if a valid postable has not been found
  def set_default_postable
    if valid_postable?
      return nil
    end
    default = PostText.create
    post_params.merge!({ postable_id: default.id, postable_type: PostText.to_s })
    default
  end

  # find the associated postable
  def postable
    postable_klass.find(post_params[:postable_id]) rescue nil
  end

  def postable_klass
    post_params[:postable_type].constantize rescue nil
  end

  # check if the postable is already associated to a post
  def is_postable_associated_to_an_existing_post?
    postable.post.present? rescue false
  end

  # a valid postable is one
  # which is already created but is not associated to any post
  def valid_postable?
    postable.present? and !is_postable_associated_to_an_existing_post?
  end
end