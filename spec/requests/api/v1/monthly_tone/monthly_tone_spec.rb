require 'rails_helper'
require 'date'

describe 'Monthly Tone Endpoint' do
  it 'returns the tone for the month' do
    user = create(:user)
    journal_entry = create(:journal_entry, created_at: Date.today, user: user, entry_text: "Today was really challenging. I hope things are easier tomorrow.")
    journal_entry_2 = create(:journal_entry, created_at: Date.today, user: user, entry_text: "Today was really challenging. I hope things are easier tomorrow.")
    tone_response = create(:tone_response, primary_tone: "Sadness", journal_entry: journal_entry)
    tone_response = create(:tone_response, primary_tone: "Happy", journal_entry: journal_entry_2)

    get "/api/v1/users/#{user.id}/tone_responses?date=2019-02"
    tone_responses = JSON.parse(response.body, symbolize_names: true)

    expect(tone_responses).to be_a(Hash)
    expect(tone_responses).to have_key(:data)
    expect(tone_responses[:data][0]).to have_key(:attributes)
    expect(tone_responses[:data][0][:attributes]).to have_key(:primary_tone)


  end
end
