class ToneResponse < ApplicationRecord
  validates_presence_of :primary_tone, :secondary_tone
  belongs_to :journal_entries
end
