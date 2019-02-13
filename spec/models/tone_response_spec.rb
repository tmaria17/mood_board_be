require 'rails_helper'

RSpec.describe ToneResponse do
  describe 'validations' do
    it {should validate_presence_of(:primary_tone)}
    it {should validate_presence_of(:primary_score)}
  end
  describe 'relationships' do
    it {should belong_to (:journal_entry)}
  end
end
