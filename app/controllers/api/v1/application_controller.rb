class Api::V1::ApplicationController < ApplicationController
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def serializer_responder(resource, serializer=nil, each_serializer=nil)
    response = { :json => resource }
    response.merge!({:serializer => serializer}) if is_a_proper_serializer(serializer)
    response.merge!({:each_serializer => each_serializer}) if is_a_proper_serializer(each_serializer)
    render response
  end

  private 

  def is_a_proper_serializer(serializer)
    serializer and serializer.superclass == ActiveModel::Serializer
  end
end
