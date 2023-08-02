require "rails_helper"

RSpec.describe "User_State Endpoints" do
  describe "get all UserStates for a user" do
    it "returns all UserStates for a user" do
      user1_id = "1"
      state1 = create(:state)
      state2 = create(:state)
      user_state1 = UserState.create!(user_id: user1_id, state_id: state1.id )
      user_state2 = UserState.create!(user_id: user1_id, state_id: state2.id )

      get "/api/v1/user_states?user_id=#{user1_id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to have_key(:data)
      expect(data[:data].count).to eq(2)

      data[:data].map do |state|
        expect(state).to have_key(:id)
        expect(state[:id]).to be_a(String)

        expect(state).to have_key(:type)
        expect(state[:type]).to be_a(String)
        expect(state[:type]).to eq("state")

        expect(state).to have_key(:attributes)
        expect(state[:attributes]).to have_key(:state_abbr)
        expect(state[:attributes][:state_abbr]).to be_a(String)

        expect(state[:attributes]).to have_key(:state_name)
        expect(state[:attributes][:state_name]).to be_a(String)
      end
    end
  end

  describe "create a user_state" do
    it "creates and saves a state to a user" do
      user1_id = "1"
      state1 = create(:state)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/user_states?user_id=#{user1_id}&state_id=#{state1.id}"

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_user_state = JSON.parse(response.body, symbolize_names: true)

      expect(created_user_state).to be_a(Hash)
      expect(created_user_state).to have_key(:data)
      expect(created_user_state[:data]).to have_key(:id)
      expect(created_user_state[:data][:id]).to be_a(String)

      expect(created_user_state[:data]).to have_key(:type)
      expect(created_user_state[:data][:type]).to be_a(String)
      expect(created_user_state[:data][:type]).to eq("user_state")

      expect(created_user_state[:data]).to have_key(:attributes)
      expect(created_user_state[:data][:attributes]).to have_key(:user_id)
      expect(created_user_state[:data][:attributes][:user_id]).to be_an(Integer)

      expect(created_user_state[:data][:attributes]).to have_key(:state_id)
      expect(created_user_state[:data][:attributes][:state_id]).to be_an(Integer)
    end
  end
end