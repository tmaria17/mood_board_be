class AffirmationWrapperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date
  attribute :affirmations do |object|
    user_id = object.affirmation_objects.first.user_id
    object.affirmation_objects.map do |aff|
      hash = Hash.new
      date = (aff.created_at).strftime('%Y-%m-%d')
      hash[:date] = date
      hash[:affirmation_text] = aff.affirmation_text
      tone_date = aff.created_at
      hash[:tone] = ToneResponse.where(created_at: tone_date.beginning_of_day..tone_date.end_of_day).first.primary_tone
      hash
    end
  end
end
