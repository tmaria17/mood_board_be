class Api::V1::ToneResponsesController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])
    tones = ToneResponse.by_monthly_tones(user.id, params[:date])
    render json: ToneResponseSerializer.new(tones)
  end
end
