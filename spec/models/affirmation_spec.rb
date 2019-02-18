require 'rails_helper'

RSpec.describe Affirmation do
  describe 'validations' do
    it {should validate_presence_of(:affirmation_text)}
  end
  describe 'relationships' do
   it {should belong_to (:user)}
  end
  describe 'methods' do
    it 'returns an array of affrimations' do
      user_1 = create(:user)
      affirmation_1 = create(:affirmation, created_at: Date.today, user: user_1)

      monthly_affirmations = Affirmation.get_affirmations(1, "2019-02")
      no_monthly_affirmations = Affirmation.get_affirmations(1, "2019-03")
      expect(monthly_affirmations.count).to eq(1)
      expect(monthly_affirmations.class).to eq(Array)
      expect(no_monthly_affirmations.count).to eq(0)
    end

  end
end
