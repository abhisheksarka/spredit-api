class Api::V1::VotesController < Api::V1::ApplicationController
  before_filter :authenticate_token
  
  def create
  	serializer_responder(vote: votable.vote_by(voter: current_jwt_authable, vote: vote_type))
  end

  private

  def vote_params
    params.require(:vote).permit(:votable_id, :votable_type, :vote_type)
  end

  def votable
  	vote_params[:votable_type].constantize.find(vote_params[:votable_id])
  end

  def vote_type
  	if vote_params[:vote_type]
  		@vote_type = true
  	else
  		@vote_type = false
  	end
  end
  
end
