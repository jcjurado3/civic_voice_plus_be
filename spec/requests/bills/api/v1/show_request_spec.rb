require "rails_helper"

RSpec.describe 'Get bill Endpoints' do
  describe "Get bill: bills found in database by bill_id" do
    it "returns data about specific bills based on bill_id", :vcr do
      bill_id = 1722281

      get "/api/v1/bills/#{bill_id}"

      bill_data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

    end
  end
end
