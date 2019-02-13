class JournalEntry < ApplicationRecord
  validates_presence_of :entry_text
  belongs_to :user
  has_many :tone_responses
end
