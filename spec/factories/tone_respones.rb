FactoryBot.define do
  factory :tone_response do
    journal_entry { nil }
    primary_tone   { ["anger", "joy", "sadness", "tentative", "analytical", "confident", "fear"].sample  }
    primary_score   { 0.88 }
  end
end
