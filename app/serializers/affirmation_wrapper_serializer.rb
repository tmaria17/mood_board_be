class AffirmationWrapperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date
  attribute :affirmations do |object|
                object.get_affirmation_text.map do |affirmation_obj|
                  Hash['affirmation_text', affirmation_obj]
                end
              end
end
