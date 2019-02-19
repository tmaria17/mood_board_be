class ToneResponseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :primary_tone
  set_id do |object|
    object.created_at.strftime('%d')
  end
end
