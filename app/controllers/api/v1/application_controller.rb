class Api::V1::ApplicationController < ApplicationController
  include JwtAuthHelper

  def default_serializer_options
    {root: false}
  end

  rescue_from ApiException { | e | handle_api_exception(e) }

  def serializer_responder(resource, serializer=nil, each_serializer=nil)
    render ResponseBuilder::MainService.new(resource, {
      serializer: serializer,
      each_serializer: each_serializer
    }).response
  end

  private

  def handle_api_exception(e)
    render ResponseBuilder::MainService.new(e).response
  end
end
