class AffirmationWrapperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :user_id
  attribute :affirmations do |object|
    object.affirmation_objects.map do |aff|
      hash = Hash.new
      user = User.find(aff.user_id)
      date = (aff.created_at).strftime('%Y-%m-%d')
      hash[:date] = date
      hash[:affirmation_text] = aff.affirmation_text
      hash[:tone] = user.tone_responses.where(created_at: date).first.primary_tone
      hash
    end
  end
end
