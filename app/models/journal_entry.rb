class JournalEntry < ApplicationRecord
  validates_presence_of :entry_text
end
