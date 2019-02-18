class Affirmation < ApplicationRecord
  validates_presence_of :affirmation_text
  belongs_to :user


  def self.get_affirmations(user_id)
    affirmation_text_array = [ ]
    Affirmation.where(user_id: user_id).where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).each do |affirmation|
      affirmation_text_array.push(affirmation.affirmation_text)
    end
    affirmation_text_array
  end

end
