require "rails_helper"
require "date"

describe "GET /api/v1/users/:id/affirmations?date=YYYY-MM" do
  it "Returns the all affirmations for queired month" do
    user = create(:user)
    affirmation = create(:affirmation, created_at: Date.today, user: user)

    params = {"date" => "2019/02"}

    get "/api/v1/users/#{user.id}/affirmations?data=YYYY-MM", :params => params

    affirmations = JSON.parse(response.body, symbolize_names: true)

    expect(affirmations).to have_key(:data)
  end
end
