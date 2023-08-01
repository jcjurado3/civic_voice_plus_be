require "rails_helper"

RSpec.describe 'Bill Search Endpoints' do
  describe "bill search: bills found in database" do
    xit "returns data about specific bills based on search query params", :vcr do

      query_params = {
        op: "getSearch",
        state: "FL",
        query: "healthcare" }

      get "/api/v1/bills", params: query_params

      bill_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(bill_data).to have_key(:data)
      expect(bill_data[:data][0]).to have_key(:id)
      expect(bill_data[:data][0][:id]).to be_a(String)

      expect(bill_data[:data][0]).to have_key(:type)
      expect(bill_data[:data][0][:type]).to be_a(String)

      expect(bill_data[:data][0]).to have_key(:attributes)
      expect(bill_data[:data][0][:attributes]).to be_a(Hash)

      expect(bill_data[:data][0][:attributes]).to have_key(:state)
      expect(bill_data[:data][0][:attributes][:state]).to be_a(String)

      expect(bill_data[:data][0][:attributes]).to have_key(:bill_number)
      expect(bill_data[:data][0][:attributes][:bill_number]).to be_a(String)

      expect(bill_data[:data][0][:attributes]).to have_key(:bill_id)
      expect(bill_data[:data][0][:attributes][:bill_id]).to be_a(Integer)

      expect(bill_data[:data][0][:attributes]).to have_key(:text_url)
      expect(bill_data[:data][0][:attributes][:text_url]).to be_a(String)

      expect(bill_data[:data][0][:attributes]).to have_key(:last_action_date)
      expect(bill_data[:data][0][:attributes][:last_action_date]).to be_a(String)

      expect(bill_data[:data][0][:attributes]).to have_key(:last_action)
      expect(bill_data[:data][0][:attributes][:last_action]).to be_a(String)

      expect(bill_data[:data][0][:attributes]).to have_key(:title)
      expect(bill_data[:data][0][:attributes][:title]).to be_a(String)
    end
  end
end