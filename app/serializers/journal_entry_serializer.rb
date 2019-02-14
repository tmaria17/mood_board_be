class JournalEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :entry_text
  attribute :primary_tone do |obj|
    "primary_tone_here"
  end
  attribute :primary_score do |obj|
    "primary_tone_here"
  end
end
