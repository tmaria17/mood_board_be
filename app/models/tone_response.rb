class ToneResponse < ApplicationRecord
  validates_presence_of :primary_tone, :secondary_tone
end
