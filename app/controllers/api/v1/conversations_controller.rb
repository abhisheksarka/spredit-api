class Api::V1::ConversationsController < Api::V1::ApplicationController
  before_filter :authenticate_token! 

  def create
    # serializer_responder jwt_sign_in(User.login_via_fb(log_in_params)), SessionSerializer
  end
  
  private

  def log_in_params
    params.permit(:accessToken, :expiresIn, :userID, :signedRequest)
  end
  
end
