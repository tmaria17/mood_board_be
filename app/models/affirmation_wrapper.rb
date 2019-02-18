class AffirmationWrapper
  attr_reader :id, :affirmation_text_array
  def initialize(user_id, date)
    @id = id
    @user_id = user_id
    @affirmation_text_array = []
    @date = date
  end
  
  def get_affirmation_text
    Affirmation.get_affirmations(@user_id,@date)
  end

end
