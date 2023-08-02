require "rails_helper"

RSpec.describe "States Endpoints" do
  describe "get all states" do
    it "lists all states" do
      list_states = create_list(:state, 10)

      get "/api/v1/states"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      state_data = JSON.parse(response.body, symbolize_names: true)

      expect(state_data).to have_key(:data)
      expect(state_data[:data]).to be_an(Array)
      expect(state_data[:data].count).to eq(10)

      state_data[:data].map do |state|
        expect(state).to have_key(:id)
        expect(state[:id]).to be_a(String)

        expect(state).to have_key(:type)
        expect(state[:type]).to be_a(String)
        expect(state[:type]).to eq("state")

        expect(state).to have_key(:attributes)
        expect(state[:attributes]).to be_a(Hash)

        expect(state[:attributes]).to have_key(:state_abbr)
        expect(state[:attributes][:state_abbr]).to be_a(String)

        expect(state[:attributes]).to have_key(:state_name)
        expect(state[:attributes][:state_name]).to be_a(String)
      end
    end
  end
end