FactoryBot.define do
  factory :affirmation do
    user { nil }
    sequence :affirmation_text   { |n| "I am beautiful! #{n}" }
  end
end
