class AffirmationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :affirmation_text, :user_id

  attribute :affirmation_messages do |object|
    affirmation_text_array = []
    Affirmation.all.each do |affirmation|
      affirmation_text_array.push(affirmation.affirmation_text)
    end
    affirmation_text_array
  end

end
