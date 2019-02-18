class Affirmation < ApplicationRecord
  validates_presence_of :affirmation_text
  belongs_to :user

  def self.get_affirmations(user_id, date)
    affirmation_text_array = [ ]
    formatted_date = Date.strptime(date, '%Y-%m')
    Affirmation.where(user_id: user_id).where(created_at: formatted_date.beginning_of_month..formatted_date.end_of_month).each do |affirmation|
      affirmation_text_array.push(affirmation.affirmation_text)
    end
    affirmation_text_array
  end
end
