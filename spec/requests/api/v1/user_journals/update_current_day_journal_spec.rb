require "rails_helper"
require "date"

describe "PATCH /api/v1/users/:id/journals?date=today" do
  it "Updates the journal entry for the current date with the submitted text" do
    user = create(:user)
    journal_entry = create(:journal_entry, created_at: Date.today, user: user, entry_text: "I had such a bad day today.")

    # update = { is_private: false }.to_json
    #   patch(:update, update, id: 1)
    #
    #   get :show, id: 1, format: :json
    #   assert_equal json['data'][0]['is_private'], false
    #
    # end

    params = { id: journal_entry.id, journal_entry: {entry_text: "I had a wonderful day today!"}}

    patch "/api/v1/users/#{user.id}/journal_entries?date=today", :params => params

    journal_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(202)
    expect(journal_response).to have_key :data
    expect(journal_response[:data]).to have_key :attributes
    expect(journal_response[:data]).to have_key :id
    expect(journal_response[:data]).to have_key :type
    expect(journal_response[:data][:attributes]).to have_key :created_at
    expect(journal_response[:data][:attributes]).to have_key :entry_text
    expect(journal_response[:data][:attributes][:entry_text]).to eq "I had a wonderful day today!"
    expect(journal_response[:data][:attributes]).to have_key :primary_score
    expect(journal_response[:data][:attributes]).to have_key :primary_tone
  end
end
