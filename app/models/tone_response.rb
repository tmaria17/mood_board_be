class ToneResponse < ApplicationRecord
  validates_presence_of :primary_tone, :primary_score
  belongs_to :journal_entry

  def self.by_journal_entry(journal_entry_id)
    self.find_by(journal_entry_id: journal_entry_id)
  end

end
