class Api::V1::Configuration::PostCategoriesController < Api::V1::ApplicationController
  before_filter :authenticate_token
  before_filter :load_resource
  
  def update
    @post_category_configuration.update(post_category_configuration_params)
    serializer_responder @post_category_configuration.reload
  end

  private

  def load_resource
    @post_category_configuration = current_jwt_authable.post_category_configuration
  end

  def post_category_configuration_params
    params.permit(:values)
  end
  
end
