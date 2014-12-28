class Api::V1::CategoriesController < Api::V1::ApplicationController
  before_filter :authenticate_token! 
  
  def index
    render :json => Category.all
  end  
end
