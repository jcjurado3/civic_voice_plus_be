require "rails_helper"

RSpec.describe "UserBills Endpoints" do
  describe "get all UserBills for a user" do
    it "returns all UserBills for a user" do
      user1_id = "1"

      bill1_id = create(:bill).id
      bill2_id = create(:bill).id

      user_bill_1 = UserBill.create!(user_id: user1_id, bill_id: bill1_id)
      user_bill_1 = UserBill.create!(user_id: user1_id, bill_id: bill2_id)

      get "/api/v1/user_bills?user_id=#{user1_id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data).to have_key(:data)
      expect(data[:data].count).to eq(2)

      data[:data].map do |bill|
        expect(bill).to have_key(:id)
        expect(bill[:id]).to be_a(String)

        expect(bill).to have_key(:type)
        expect(bill[:type]).to be_a(String)
        expect(bill[:type]).to eq("bill")

        expect(bill).to have_key(:attributes)
        expect(bill[:attributes]).to have_key(:bill_number)
        expect(bill[:attributes][:bill_number]).to be_a(String)

        expect(bill[:attributes]).to have_key(:bill_id)
        expect(bill[:attributes][:bill_id]).to be_an(Integer)

        expect(bill[:attributes]).to have_key(:description)
        expect(bill[:attributes][:description]).to be_a(String)

        expect(bill[:attributes]).to have_key(:state)
        expect(bill[:attributes][:state]).to be_a(String)

        expect(bill[:attributes]).to have_key(:status)
        expect(bill[:attributes][:status]).to be_an(Integer)

        expect(bill[:attributes]).to have_key(:sponsors)
        expect(bill[:attributes][:sponsors]).to be_an(Array)

        expect(bill[:attributes]).to have_key(:texts)
        expect(bill[:attributes][:texts]).to be_an(Array)
      end
    end
  end

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

      bill1 = Bill.create(id: 7333, bill_id: 1719625)
      bill2 = Bill.create(id: 7334, bill_id: 1721105)
      
      user_bill_1 = UserBill.create!(user_id: user1_id, bill_id: bill1.id)
      user_bill_2 = UserBill.create!(user_id: user1_id, bill_id: bill2.id)

      headers = { 'CONTENT_TYPE' => 'application/json' }

      user_bills= UserBill.count

      delete "/api/v1/user_bills?user_id=#{user1_id}&bill_id=#{bill1.bill_id}", headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(UserBill.count).to eq(user_bills - 1)
    end
  end
end