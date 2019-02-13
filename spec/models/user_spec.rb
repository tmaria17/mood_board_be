require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
  end
  describe 'relationships' do
   it {should have_many(:tone_responses)}
   it {should have_many(:journal_entries)}
   it {should have_many(:affirmations)}
 end
end
