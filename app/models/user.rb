class User < ApplicationRecord
  validates_presence_of :email, :name
  has_many :affirmations
  has_many :journal_entries
  has_many :tone_responses, through: :journal_entries

  validates :email, uniqueness: true

  has_secure_password validations: false
end
