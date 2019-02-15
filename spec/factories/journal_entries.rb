FactoryBot.define do
  factory :journal_entry do
    user { nil }
    sequence :entry_text   { |n| "I am beautiful! #{n}" }
  end
end
