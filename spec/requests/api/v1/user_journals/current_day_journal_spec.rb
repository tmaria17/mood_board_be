require "rails_helper"
require "date"

describe "GET /api/v1/users/:id/journals?date=today" do
  it "Returns the journal entry for the current date" do
    user = create(:user)
    journal_entry = create(:journal_entry, created_at: Date.today, user: user)

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
    expect(journal_response[:data][:attributes][:entry_text]).to_not be nil
    expect(journal_response[:data][:attributes]).to have_key :primary_score
    expect(journal_response[:data][:attributes]).to have_key :primary_tone
  end
end
