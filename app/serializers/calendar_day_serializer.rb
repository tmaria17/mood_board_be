class CalendarDaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :date

  attribute :journal_entry_text do |obj|
    obj.journal_entry_text
  end

  attribute :primary_tone do |obj|
    obj.primary_tone
  end

  attribute :primary_score do |obj|
    obj.primary_score
  end

  attribute :affirmations do |obj|
    obj.affirmations
  end

end
