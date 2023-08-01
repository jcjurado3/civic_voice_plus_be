require "rails_helper"

RSpec.describe "UserBills Endpoints" do
  describe "create a userbill association" do
    it "saves a bill to a user" do
      user1_id = "1"
      bill_1 = create(:bill)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/user_bills?user_id=#{user1_id}&bill_id=#{bill_1.id}", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(201)

      created_user_bill = JSON.parse(response.body, symbolize_names: true)

      expect(created_user_bill).to be_a(Hash)
      expect(created_user_bill).to have_key(:data)
      expect(created_user_bill[:data]).to have_key(:id)
      expect(created_user_bill[:data][:id]).to be_a(String)

      expect(created_user_bill[:data]).to have_key(:type)
      expect(created_user_bill[:data][:type]).to be_a(String)
      expect(created_user_bill[:data][:type]).to eq("user_bill")

      expect(created_user_bill[:data]).to have_key(:attributes)
      expect(created_user_bill[:data][:attributes]).to have_key(:user_id)
      expect(created_user_bill[:data][:attributes][:user_id]).to be_an(Integer)

      expect(created_user_bill[:data][:attributes]).to have_key(:bill_id)
      expect(created_user_bill[:data][:attributes][:bill_id]).to be_an(Integer)
    end

    it "does not create a UserBill if one already exists" do
      user1_id = "1"
      bill_1 = create(:bill)
      user_bill = UserBill.create!(user_id: user1_id, bill_id: bill_1.id)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post "/api/v1/user_bills?user_id=#{user1_id}&bill_id=#{bill_1.id}", headers: headers

      expect(response).to_not be_successful
      expect(response.status).to eq(422)
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to be_a Hash
      expect(data).to have_key(:error)
      expect(data[:error]).to eq('User has already saved this bill')
    end
  end

  describe "destroys a user_bill association" do
    it "can remove a user_bill association" do
      user1_id = "1"
      user2_id = "2"

      bill1 = create(:bill)
      bill2 = create(:bill)

      user_bill_1 = UserBill.create!(user_id: user1_id, bill_id: bill1.id)
      user_bill_2 = UserBill.create!(user_id: user1_id, bill_id: bill2.id)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      user_bills= UserBill.count

      delete "/api/v1/user_bills?user_id=#{user1_id}&bill_id=#{bill1.id}", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(UserBill.count).to eq(user_bills - 1)
    end
  end
end