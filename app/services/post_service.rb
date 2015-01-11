class PostService
  attr_accessor :post_params,
                :postable_params,
                :post_publishable

  def initialize(post_publishable, post_params, postable_params)
    @post_publishable = post_publishable
    @post_params = post_params
    @postable_params = postable_params
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
    post.reload
  end

  private

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