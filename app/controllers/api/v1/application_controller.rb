class Api::V1::ApplicationController < ApplicationController
  include JwtAuthHelper

  def default_serializer_options
    {root: false}
  end

  rescue_from ::ApiException do | e | 
    handle_api_exception(e)
  end

  def serializer_responder(resource, serializer=nil, each_serializer=nil)
    render json: ResponseBuilder::MainService.new(resource, {
      serializer: serializer,
      each_serializer: each_serializer
    }, params).response
  end

  def handle_api_exception(e)
    render json: ResponseBuilder::MainService.new(e, { }, params).response
  end
end
