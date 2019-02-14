require 'rails_helper'
describe WatsonToneService do
  it 'exists' do
      service = WatsonToneService.new("dogs+are+awesome")
      expect(service).to be_a(WatsonToneService)
  end
  it "returns a tone" do
    service = WatsonToneService.new("dogs are awesome")

    expect(service.get_tone).to be_a(Hash)
    expect(service.get_tone).to have_key(:document_tone)
    expect(service.get_tone[:document_tone]).to have_key(:tones)
    expect(service.get_tone[:document_tone][:tones][0]).to have_key(:score)
    expect(service.get_tone[:document_tone][:tones][0]).to have_key(:tone_id)
    expect(service.get_tone[:document_tone][:tones][0]).to have_key(:tone_name)
  end
end
