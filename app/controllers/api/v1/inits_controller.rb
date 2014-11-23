class Api::V1::InitsController < Api::V1::ApplicationController
  
  def show
    serializer_responder({
      :app_id => ENV['FB_APP_ID'], 
      :permissions_scope => ENV['FB_PERMISSIONS_SCOPE']
    })
  end
  
end
