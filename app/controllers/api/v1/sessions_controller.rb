class Api::V1::SessionsController < Api::V1::ApplicationController
  before_filter :authenticate_token, only: [:destroy] 

  def create
    serializer_responder jwt_sign_in(User.login_via_fb(log_in_params)), SessionSerializer
  end

  def destroy
    serializer_responder jwt_sign_out
  end

  def current
    token = JwToken.find_by(value: token_value_sent)
    serializer_responder((token.present? and !token.expired?) ? token : JwToken.new, SessionSerializer)
  end

  private

  def log_in_params
    params.permit(:accessToken, :expiresIn, :userID, :signedRequest)
  end
  
end
