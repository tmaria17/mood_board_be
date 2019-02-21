class AffirmationWrapper
  attr_reader :id, :user_id, :date
  def initialize(user_id, date)
    @id = Time.now
    @user_id = user_id
    @date = date
    @_affirmation_ojects = nil
  end

  def affirmation_objects
    @_affirmation_objects ||= Affirmation.within_period_by_user(user_id,date)
  end

end
