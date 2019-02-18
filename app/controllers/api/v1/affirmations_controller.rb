class Api::V1::AffirmationsController < ApplicationController
  def index
    affirmation_wrapper = AffirmationWrapper.new(params[:user_id])
    
    render json: AffirmationWrapperSerializer.new(affirmation_wrapper)
  end
end
