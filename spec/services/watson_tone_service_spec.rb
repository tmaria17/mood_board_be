require 'rails_helper'
describe WatsonToneService do
  it 'exists' do
      service = WatsonToneService.new("dogs")
      binding.pry
      expect(service).to be_a(WatsonToneService)
    end
  end
