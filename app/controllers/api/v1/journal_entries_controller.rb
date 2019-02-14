class Api::V1::JournalEntriesController < ApplicationController

  def show
    if params[:date] == "today"
      journal = JournalEntry.find_by(created_at: Date.today)
      render json: JournalEntrySerializer.new(journal)
    else
      render json: {"test": "test"}
    end
  end

end
