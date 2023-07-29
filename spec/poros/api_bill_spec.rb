require "rails_helper"

RSpec.describe ApiBill do
  describe "existance" do
    it "exists and has attributes" do
      params = {
          op: "getSearch",
          state: "FL",
          query: "healthcare" }

      bills_data = BillSearchFacade.new(params).bills

      expect(bills_data.count).to eq(50)
      expect(bills_data.first).to be_a(ApiBill)
      expect(bills_data.first.bill_id).to be_an(Integer)
      expect(bills_data.first.id).to be_an(Integer)
      expect(bills_data.first.bill_number).to be_a(String)
      expect(bills_data.first.last_action).to be_a(String)
      expect(bills_data.first.last_action_date).to be_a(String)
      expect(bills_data.first.state).to be_a(String)
      expect(bills_data.first.text_url).to be_a(String)
      expect(bills_data.first.title).to be_a(String)
    end
  end
end