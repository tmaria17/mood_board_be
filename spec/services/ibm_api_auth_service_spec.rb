require 'rails_helper'
describe IbmApiAuthService do
  it 'exists' do
      service = IbmApiAuthService.new
      expect(service).to be_a(IbmApiAuthService)
  end
  it "returns API credentials" do
    VCR.use_cassette("ibm_api_authorization") do
      service = IbmApiAuthService.new
      results = service.access_information

      expect(results).to be_a(Hash)
      expect(results).to have_key(:access_token)
    end
  end
  it "returns API authorization key" do
    VCR.use_cassette("ibm_api_authorization") do
      service = IbmApiAuthService.new
      results = service.access_token
      
      expect(results).to be_a(String)
    end
  end
end
