require "rails_helper"

RSpec.describe "States Endpoints" do
  describe "get all states" do
    it "lists all states" do
      list_states = create_list(:state, 10)

      get "/api/v1/states"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      state_data = JSON.parse(response.body, symbolize_names: true)

      binding.pry
    end
  end
end