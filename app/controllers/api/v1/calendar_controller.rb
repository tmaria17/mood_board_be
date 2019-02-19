class Api::V1::CalendarController < ApplicationController
  def show
    calendar_day = CalendarDay.new(params[:user_id], params[:date])

    render json: CalendarDaySerializer.new(calendar_day)
  end
end
