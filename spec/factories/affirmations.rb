FactoryBot.define do
  factory :affirmation do
    user { nil }
    sequence :entry_text   { |n| "This is a journal entry example #{n}" }
  end
end