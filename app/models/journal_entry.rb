class JournalEntry < ApplicationRecord
  belongs_to :user
  has_one :tone_response
end
