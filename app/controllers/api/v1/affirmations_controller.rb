class Api::V1::AffirmationsController < ApplicationController
  def index
    render json: Affirmation.where(user_id: params[:user_id])
  end
end
