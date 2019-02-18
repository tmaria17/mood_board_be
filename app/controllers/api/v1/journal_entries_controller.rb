class Api::V1::JournalEntriesController < ApplicationController

  def show
    if params[:date] == "today"
      journal = JournalEntry.where(created_at: Date.today).first_or_create(user_id: params[:user_id])

      render json: JournalEntrySerializer.new(journal)
    else
    end
  end

  def update
    if params[:date] == "today"
      journal = JournalEntry.find_user_daily_journal(params[:user_id])
      journal.update(journal_params)
      journal.get_tone_results

      render status: 202, json: JournalEntrySerializer.new(journal)
    else
    end
  end

  private
  def journal_params
    params.require(:journal_entry).permit(:entry_text)
  end

end
