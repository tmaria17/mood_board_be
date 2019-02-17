class JournalEntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :entry_text
  attribute :tones do |obj|
    obj.entry_tones
  end
  # attribute :primary_score do |obj|
  #   obj.entry_primary_score
  # end
  # attribute :secondary_tone do |obj|
  #   obj.entry_secondary_tone
  # end
  # attribute :secondary_score do |obj|
  #   obj.entry_secondary_score
  # end
end
