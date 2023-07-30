require "rails_helper"

RSpec.describe ApiBill do
  describe "existance" do
    it "exists and has attributes", :vcr do
      params = {
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
      expect(bills_data.first.status).to be_a(NilClass)
      expect(bills_data.first.description).to be_a(NilClass)
      expect(bills_data.first.sponsors).to be_a(NilClass)
      expect(bills_data.first.text).to be_a(NilClass)
    end

    it "has more attributes", :vcr do
      params = {
              id: 1722281
              }
      
      bills_data = BillSearchFacade.new(params).bill
        expect(bills_data.status).to be_a(Integer)
        expect(bills_data.description).to be_a(String)
        expect(bills_data.sponsors).to be_a(Array)
        expect(bills_data.text_url).to be_a(NilClass)
        expect(bills_data.last_action).to be_a(NilClass)
        expect(bills_data.last_action_date).to be_a(NilClass)
        expect(bills_data.text).to be_an(Array)
        
      bills_data.text.map do |doc|
        expect(doc[:doc_id]).to be_a(Integer)
      end

      bills_data.sponsors.map do |sponsor|
        expect(sponsor[:name]).to be_a(String)
        expect(sponsor[:party_id]).to be_a(String)
      end
    end
  end
end