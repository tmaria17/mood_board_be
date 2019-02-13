class ToneResponse < ApplicationRecord
  validates_presence_of :primary_tone, :primary_score
  belongs_to :journal_entry
end
