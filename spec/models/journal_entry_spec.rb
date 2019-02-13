require 'rails_helper'

RSpec.describe JournalEntry do
  describe 'validations' do
    it {should validate_presence_of(:entry_text)}
  end
  describe 'relationships' do
   it {should have_many(:tone_responses)}
   it {should belong_to (:user)}
  end
end
