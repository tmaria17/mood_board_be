require "rails_helper"
require "date"

describe "Affirmation Endpoints" do
  it "it GETS affirmations" do
    user_1 = create(:user)
    user_2 = User.new(name: "Jake", email: "ilikeshakes@gmail.com", password: "cat")

    affirmation_1 = create(:affirmation, created_at: Date.today, user: user_1)
    affirmation_2 = create(:affirmation, created_at: Date.today, user: user_2)
    affirmation_3 = create(:affirmation, created_at: Date.today, user: user_1)


    get "/api/v1/users/#{user_1.id}/affirmations?date=2019-02"
    affirmations = JSON.parse(response.body, symbolize_names: true)

    expect(affirmations).to have_key(:data)
    expect(affirmations[:data]).to have_key(:id)
    expect(affirmations[:data]).to have_key(:type)
    expect(affirmations[:data]).to have_key(:attributes)
    expect(affirmations[:data][:type]).to eq("affirmation_wrapper")
    expect(affirmations[:data][:attributes]).to have_key(:affirmations)
    expect(affirmations[:data][:attributes][:affirmations].class).to eq(Array)
  end
  it 'POSTS affirmations' do
    user = create(:user)

    post_params =  { affirmation: {
      'affirmation_text': "I am awesome! "
        }}

    post "/api/v1/users/#{user.id}/affirmations?date=today", params: post_params

    expect(response).to be_successful
    expect(user.affirmations.length).to eq(1)
    expect(user.affirmations.first.affirmation_text).to eq("I am awesome! ")
  end
end
