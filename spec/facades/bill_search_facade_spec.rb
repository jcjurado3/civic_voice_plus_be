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

    describe "#bill" do
      it "returns a single bill based of bill_id number", :vcr do
        params = {
          id: 1722281
        }

        bill = BillSearchFacade.new(params).bill
        expect(bill).to be_a(ApiBill)
        expect(bill.bill_id).to be_an(Integer)
        expect(bill.bill_id).to eq(1722281)
        expect(bill.id).to be_an(Integer)
        expect(bill.id).to eq(1722281)
        expect(bill.bill_number).to be_a(String)
        expect(bill.bill_number).to eq("H1255")
        expect(bill.state).to be_a(String)
        expect(bill.state).to eq("FL")
        expect(bill.description).to be_a(String)
        expect(bill.description).to eq("Abolishes district, transfers assets & liabilities of district; requires certain books to be deposited into Winter Garden Heritage Museum; provides effective date.")
        expect(bill.status).to be_a(Integer)
        expect(bill.sponsors).to be_a(Array)
        expect(bill.sponsors.first[:name]).to eq("Doug Bankson")
        expect(bill.texts).to be_a(Array)
        expect(bill.text_url).to be_a(NilClass)
        expect(bill.last_action).to be_a(NilClass)
        expect(bill.last_action_date).to be_a(NilClass)
      end

      it " retrieves bill and representative(s) information", :vcr do
        params = {
          id: 1710836
        }

        bill = BillSearchFacade.new(params).bill
      end
    end
  end
end
