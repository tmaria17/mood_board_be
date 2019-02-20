class Api::V1::JournalEntriesController < ApplicationController

  def show
    if params[:date] == "today"
      user = User.find(params[:user_id])
      journal = JournalEntry.where(created_at: Date.today).where(user: user).first_or_create(user: user)

      render json: JournalEntrySerializer.new(journal)
    else
    end
  end

  def update
    if params[:date] == "today"
      journal = JournalEntry.find_user_daily_journal(params[:user_id])

      journal.update(journal_params)
      journal.save
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
