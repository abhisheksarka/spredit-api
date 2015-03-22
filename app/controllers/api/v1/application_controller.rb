class Api::V1::ApplicationController < ApplicationController
  include JwtAuthHelper

  def default_serializer_options
    {root: false}
  end

  def serializer_responder(resource, serializer=nil, each_serializer=nil)
    render ResponseBuilder::MainService.new(resource, {
      serializer: serializer,
      each_serializer: each_serializer
    })
  end

end
