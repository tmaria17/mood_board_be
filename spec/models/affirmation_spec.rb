require 'rails_helper'

RSpec.describe Affirmation do
  describe 'validations' do
    it {should validate_presence_of(:affirmation_text)}
  end
  describe 'relationships' do
   it {should belong_to (:user)}
  end
end
