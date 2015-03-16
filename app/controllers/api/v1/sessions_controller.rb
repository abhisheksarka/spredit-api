class Api::V1::SessionsController < Api::V1::ApplicationController
  before_filter :authenticate_token, :only => [:destroy, :validate] 

  def create
    serializer_responder jwt_sign_in(User.login_via_fb(log_in_params)), SessionSerializer
  end

  def destroy
    serializer_responder jwt_sign_out
  end

  def validate
    serializer_responder({ is_token_valid: current_jw_token_valid? })
  end

  private

  def log_in_params
    params.permit(:accessToken, :expiresIn, :userID, :signedRequest)
  end
  
end
