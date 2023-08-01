require "rails_helper"

RSpec.describe 'Get bill Endpoints' do
  describe "Get bill: bills found in database by bill_id" do
    it "returns data about specific bills based on bill_id", :vcr do
      bill_id = 1722281

      get "/api/v1/bills/#{bill_id}"

      bill_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(bill_data).to have_key(:data)
      expect(bill_data[:data]).to have_key(:attributes)
      expect(bill_data[:data][:attributes]).to be_a(Hash)

      expect(bill_data[:data][:attributes]).to have_key(:status)
      expect(bill_data[:data][:attributes][:status]).to be_a(Integer)
      
      expect(bill_data[:data][:attributes]).to have_key(:description)
      expect(bill_data[:data][:attributes][:description]).to be_a(String)
      
      expect(bill_data[:data][:attributes]).to have_key(:sponsors)
      expect(bill_data[:data][:attributes][:sponsors]).to be_a(Array)

      sponsors = bill_data[:data][:attributes][:sponsors]

      sponsors.map do |sponsor| 
        expect(sponsor).to be_a(Hash)
        
        expect(sponsor).to have_key(:party_id)
        expect(sponsor[:party_id]).to be_a(String)
        
        expect(sponsor).to have_key(:name)
        expect(sponsor[:name]).to be_a(String)
      end

      expect(bill_data[:data][:attributes]).to have_key(:text)
      expect(bill_data[:data][:attributes][:text]).to be_a(Array)
    end
  end
end




