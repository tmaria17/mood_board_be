class Affirmation < ApplicationRecord
  validates_presence_of :affirmation_text
  belongs_to :user
end
