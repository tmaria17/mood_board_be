require 'rails_helper'
describe WatsonToneService do
  it 'exists' do
      service = WatsonToneService.new("dogs+are+awesome")
      expect(service).to be_a(WatsonToneService)
  end
  it "returns a tone" do
    VCR.use_cassette("watson_tone_request") do
      service = WatsonToneService.new("dogs are awesome")
      results = service.get_tone

      expect(results).to be_a(Hash)
      expect(results).to have_key(:document_tone)
      expect(results[:document_tone]).to have_key(:tones)
      expect(results[:document_tone][:tones][0]).to have_key(:score)
      expect(results[:document_tone][:tones][0]).to have_key(:tone_id)
      expect(results[:document_tone][:tones][0]).to have_key(:tone_name)
      expect(results[:document_tone][:tones][0][:tone_name]).to eq("Joy")
      expect(results[:document_tone][:tones][0][:tone_id]).to eq("joy")
      expect(results[:document_tone][:tones][0][:score]).to eq(0.928277)
    end
  end
end
