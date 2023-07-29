require "rails_helper"

describe BillService do
  describe "instance methods" do
    describe "#bills_by_query" do
      it "returns bills based on query parameters" do
        query_params = {
          op: "getSearch",
          state: "FL",
          query: "healthcare" }

        bills = BillService.new(query_params).bills_by_query

        expect(bills[:searchresult][:"0"]).to have_key(:state)
        expect(bills[:searchresult][:"0"][:state]).to be_a(String)

        expect(bills[:searchresult][:"0"]).to have_key(:bill_number)
        expect(bills[:searchresult][:"0"][:bill_number]).to be_a(String)

        expect(bills[:searchresult][:"0"]).to have_key(:bill_id)
        expect(bills[:searchresult][:"0"][:bill_id]).to be_a(Integer)

        expect(bills[:searchresult][:"0"]).to have_key(:text_url)
        expect(bills[:searchresult][:"0"][:text_url]).to be_a(String)

        expect(bills[:searchresult][:"0"]).to have_key(:last_action_date)
        expect(bills[:searchresult][:"0"][:last_action_date]).to be_a(String)

        expect(bills[:searchresult][:"0"]).to have_key(:last_action)
        expect(bills[:searchresult][:"0"][:last_action]).to be_a(String)

        expect(bills[:searchresult][:"0"]).to have_key(:title)
        expect(bills[:searchresult][:"0"][:title]).to be_a(String)
      end
    end
  end
end
