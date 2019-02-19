class Api::V1::AffirmationsController < ApplicationController
  def index
    affirmation_wrapper = AffirmationWrapper.new(params[:user_id], params[:date])

    render json: AffirmationWrapperSerializer.new(affirmation_wrapper)
  end

  def create
    user = User.find_by(id: params[:user_id])
    if user
      user.affirmations.create(affirmation_text: params[:affirmation_text])
      render status: 201
    else
      render status: 400
    end
  end
end
