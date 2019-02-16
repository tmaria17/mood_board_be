class Api::V1::JournalEntriesController < ApplicationController

  def show
    if params[:date] == "today"
      journal = JournalEntry.find_or_create_by(created_at: Date.today)
      render json: JournalEntrySerializer.new(journal)
    else
      #render the journal for the date requested
    end
  end

  def update
    if params[:date] == "today"
      journal = JournalEntry.find_by(created_at: Date.today)
      journal.update(journal_params)
      render status: 202, json: JournalEntrySerializer.new(journal)
    else
      #update the journal for the date requested
    end
  end

  private
  def journal_params
    params.require(:journal_entry).permit(:entry_text)
  end

end
