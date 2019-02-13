FactoryBot.define do
  factory :journal_entry do
    user { nil }
    sequence :affirmation_text   { |n| "I am beautiful! #{n}" }
  end
end
