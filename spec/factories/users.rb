FactoryBot.define do
  factory :user do
    sequence :name { |n| "Jane Smith#{n}" }
    sequence :password { "Password" }
    sequence :email { |n| "user@none_sense#{1}.com" }
  end
end
