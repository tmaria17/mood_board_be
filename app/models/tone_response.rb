class ToneResponse < ApplicationRecord
  validates_presence_of :primary_tone, :primary_score
  belongs_to :journal_entry

  def self.by_journal_entry(journal_entry_id)
    self.find_by(journal_entry_id: journal_entry_id)
  end

  def self.by_monthly_tones(user_id, date)
    user = User.find_by(id: user_id)
    formatted_date = Date.strptime(date, '%Y-%m')
    user.tone_responses.where(created_at: formatted_date.beginning_of_month..formatted_date.end_of_month)
  end

end
