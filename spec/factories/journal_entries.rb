FactoryBot.define do
  factory :journal_entry do
    user { nil }
    sequence :entry_text   { |n| "This is a journal entry example #{n}" }
  end
end
