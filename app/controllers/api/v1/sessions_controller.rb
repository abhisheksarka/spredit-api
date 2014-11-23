class Api::V1::SessionsController < Api::V1::ApplicationController
  
  def create
    serializer_responder User.login_via_fb(log_in_params)
  end

  def destroy
  end

  private

  def log_in_params
    params.permit(:accessToken, :expiresIn, :userID, :signedRequest)
  end
  
end
