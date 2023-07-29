require "rails_helper"

RSpec.describe BillSearchFacade do
  describe "class methods" do
    describe "#bills" do
      it "returns a list of all bills that match the query inputs and creates ApiBill objects", :vcr do
        params = {
          op: "getSearch",
          state: "FL",
          query: "healthcare" }

        bills = BillSearchFacade.new(params).bills

        expect(bills).to be_an(Array)
        expect(bills.first).to be_a(ApiBill)
        expect(bills.first.bill_id).to be_an(Integer)
        expect(bills.first.id).to be_an(Integer)
        expect(bills.first.bill_number).to be_a(String)
        expect(bills.first.last_action).to be_a(String)
        expect(bills.first.last_action_date).to be_a(String)
        expect(bills.first.state).to be_a(String)
        expect(bills.first.text_url).to be_a(String)
        expect(bills.first.title).to be_a(String)
      end
    end
  end
end
