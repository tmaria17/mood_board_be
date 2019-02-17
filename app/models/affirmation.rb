class Affirmation < ApplicationRecord
  validates_presence_of :affirmation_text
  belongs_to :user

  # def self.get_text
  #   affirmation_text_array = []
  #   Affirmation.all.each do |affirmation|
  #     affirmation_text_array.push(affirmation.affirmation_text)
  #   end
  #   affirmation_text_array
  # end
  # def get_text(user)
  #   affirmation_text_array = []
  #   Affirmation.where(user_id: user.id).each do |affirmation|
  #     affirmation_text_array.push(affirmation.affirmation_text)
  #   end
  #   affirmation_text_array
  # end
end
