require 'rails_helper'

RSpec.describe Affirmation do
  describe 'validations' do
    it {should validate_presence_of(:affirmation_text)}
  end
  describe 'relationships' do
   it {should belong_to (:user)}
  end

  describe 'methods' do
    it 'returns an array of affirmation texts'do
      user= create(:user)
      affirmation_1 = create(:affirmation, user_id: user.id )
      affirmation_2 = create(:affirmation, user_id: user.id )
      affirmations = Affirmation.get_text
      expect(affirmations.count).to eq(2)
    end
  end
end
