require "rails_helper"
require "date"

describe "GET /api/v1/users/:id/calendar?date=YYYY-MM-DD" do
  it "returns the journal entry, tone response, and affirmations created and saved on the queried date" do
    date = Date.new(2019,01,17)

    user = create(:user)
    journal_entry = create(:journal_entry, created_at: date, user: user, entry_text: "Today was really challenging. I hope things are easier tomorrow.")
    tone_response = create(:tone_response, primary_tone: "sadness", journal_entry: journal_entry)
    create_list(:affirmation, 3, user: user, created_at: date)

    get "/api/v1/users/#{user.id}/calendar?date=2019-01-17"

    calendar_day = JSON.parse(response.body, symbolize_names: true)

    expect(calendar_day).to have_key(:data)
    expect(calendar_day[:data]).to have_key(:id)
    expect(calendar_day[:data]).to have_key(:type)
    expect(calendar_day[:data]).to have_key(:attributes)
    expect(calendar_day[:data][:attributes]).to have_key(:date)

    expect(calendar_day[:data][:attributes]).to have_key(:journal_entry_text)
    expect(calendar_day[:data][:attributes][:journal_entry_text]).to eq journal_entry.entry_text

    expect(calendar_day[:data][:attributes]).to have_key(:primary_tone)
    expect(calendar_day[:data][:attributes][:primary_tone]).to eq tone_response.primary_tone

    expect(calendar_day[:data][:attributes]).to have_key(:primary_score)
    expect(calendar_day[:data][:attributes][:primary_score]).to eq tone_response.primary_score.to_s

    expect(calendar_day[:data][:attributes]).to have_key(:affirmations)
    expect(calendar_day[:data][:attributes][:affirmations]).to be_an Array
    expect(calendar_day[:data][:attributes][:affirmations].first).to have_key(:affirmation_text)
    expect(calendar_day[:data][:attributes][:affirmations].length).to eq 3
  end
end
