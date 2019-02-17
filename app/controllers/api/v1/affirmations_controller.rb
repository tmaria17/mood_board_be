class Api::V1::AffirmationsController < ApplicationController
  def index
    # binding.pry
    render json: Affirmation.where(user_id: params[:id])
  end
end
