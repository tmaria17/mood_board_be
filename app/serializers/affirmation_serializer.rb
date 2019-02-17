class AffirmationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :affirmation_text
end
