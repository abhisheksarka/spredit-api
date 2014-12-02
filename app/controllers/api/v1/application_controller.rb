class Api::V1::ApplicationController < ApplicationController
  include JwtAuthHelper

  def default_serializer_options
    {root: false}
  end

  def serializer_responder(resource, serializer=nil, each_serializer=nil)
    response = { :json => resource }
    response.merge!({:serializer => serializer}) if serializer
    response.merge!({:each_serializer => each_serializer}) if each_serializer
    render response
  end

end
