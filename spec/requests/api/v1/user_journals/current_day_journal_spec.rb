require "rails_helper"
require "date"

describe "GET /api/v1/users/:id/journals?date=today" do
  it "Returns the journal entry for the current date" do
    user = create(:user)
    user.journal_entries.create(created_at: Date.today)

    params = {"date" => "today"}

    get "/api/v1/users/#{user.id}/journal_entries?date=today", :params => params

    journal_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(journal_response).to have_key :data
    expect(journal_response[:data]).to be_an Array
    expect(journal_response[:data].first).to have_key :attributes
  end
end
