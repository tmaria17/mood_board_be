FactoryBot.define do
  factory :affirmation do
    user { nil }
    sequence :affirmation_text   { |n| "This is an affirmation example #{n}" }
  end
end
