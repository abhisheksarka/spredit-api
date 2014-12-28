class Api::V1::ConversationsController < Api::V1::ApplicationController
  before_filter :authenticate_token! 

  def create
    serializer_responder current_jwt_authable.conversations.create(conversation_params), ConversationSerializer
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :category_id)
  end
  
end
