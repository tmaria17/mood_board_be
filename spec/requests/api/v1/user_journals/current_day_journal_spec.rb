require "rails_helper"
require "date"

describe "GET /api/v1/users/:id/journals?date=today" do
  it "Returns the existing journal entry for the current date" do
    user = create(:user)
    journal_entry = create(:journal_entry, created_at: Date.today, user: user, entry_text: "Today was really challenging. I hope things are easier tomorrow.")
    tone_response = create(:tone_response, primary_tone: "Sadness", journal_entry: journal_entry)

    params = {"date" => "today"}

    get "/api/v1/users/#{user.id}/journal_entries?date=today", :params => params

    journal_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(journal_response).to have_key :data
    expect(journal_response[:data]).to have_key :attributes
    expect(journal_response[:data]).to have_key :id
    expect(journal_response[:data]).to have_key :type
    expect(journal_response[:data][:attributes]).to have_key :created_at
    expect(journal_response[:data][:attributes]).to have_key :entry_text
    expect(journal_response[:data][:attributes][:entry_text]).to eq journal_entry.entry_text
    expect(journal_response[:data][:attributes]).to have_key :tones
    expect(journal_response[:data][:attributes][:tones].first[:primary_tone]).to eq "Sadness"
  end

  it "Returns a blank journal entry for the current date if one doesnt exist yet" do
    user = create(:user)

    params = {"date" => "today"}

    get "/api/v1/users/#{user.id}/journal_entries?date=today", :params => params

    journal_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(journal_response).to have_key :data
    expect(journal_response[:data]).to have_key :attributes
    expect(journal_response[:data]).to have_key :id
    expect(journal_response[:data]).to have_key :type
    expect(journal_response[:data][:attributes]).to have_key :created_at
    expect(journal_response[:data][:attributes]).to have_key :entry_text
    expect(journal_response[:data][:attributes][:entry_text]).to be nil
    expect(journal_response[:data][:attributes]).to have_key :tones
    expect(journal_response[:data][:attributes][:tones]).to be_an Array
    expect(journal_response[:data][:attributes][:tones].length).to eq 0

  end
end
