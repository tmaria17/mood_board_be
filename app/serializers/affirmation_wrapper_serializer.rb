class AffirmationWrapperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date
  attribute :affirmations do |object|
    user_id = object.affirmation_objects.first.user_id
    user = User.find(user_id)
    object.affirmation_objects.map do |aff|
      hash = Hash.new
      date = (aff.created_at).strftime('%Y-%m-%d')
      hash[:date] = date
      hash[:affirmation_text] = aff.affirmation_text
      if user.tone_responses.where(created_at: date).first == nil
        hash[:tone] = "undeterminable"
      else
        hash[:tone] = user.tone_responses.where(created_at: date).first.primary_tone
      end
      hash
    end
  end
end
