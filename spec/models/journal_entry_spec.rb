require 'rails_helper'

RSpec.describe JournalEntry do
  describe 'relationships' do
   it {should have_one(:tone_response)}
   it {should belong_to (:user)}
  end
end
