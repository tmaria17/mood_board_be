class AffirmationWrapper
  attr_reader :id, :affirmation_text_array
  def initialize(user_id)
    @id = id
    @user_id = user_id
    @affirmation_text_array = []
  end

  # def get_affirmation_text
  #   Affirmation.where(user_id: @user_id).where(created_at: Time.now.beginning_of_month..Time.now.end_of_month).each do |affirmation|
  #     @affirmation_text_array.push(affirmation.affirmation_text)
  #   end
  # end
  def get_affirmation_text
    Affirmation.get_affirmations(@user_id)
  end

end
