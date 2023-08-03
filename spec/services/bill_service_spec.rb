require "rails_helper"

describe BillService do
  describe "instance methods" do
    describe "#bills_by_query" do
      it "returns bills based on query parameters", :vcr do
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

    describe "#bills_by_id" do
      it "returns bills based on id parameter", :vcr do
        params = {
          id: 1722281
        }

        bill_data = BillService.new(params).bills_by_id

        expect(bill_data[:bill]).to have_key(:state)
        expect(bill_data[:bill][:state]).to be_a(String)
        expect(bill_data[:bill]).to have_key(:bill_number)
        expect(bill_data[:bill][:bill_number]).to be_a(String)
        expect(bill_data[:bill]).to have_key(:bill_id)
        expect(bill_data[:bill][:bill_id]).to be_a(Integer)
        expect(bill_data[:bill]).to have_key(:texts)
        expect(bill_data[:bill][:texts]).to be_a(Array)
        expect(bill_data[:bill]).to have_key(:description)
        expect(bill_data[:bill][:description]).to be_a(String)
        expect(bill_data[:bill]).to have_key(:sponsors)
        expect(bill_data[:bill][:sponsors]).to be_a(Array)
        expect(bill_data[:bill]).to have_key(:status)
        expect(bill_data[:bill][:status]).to be_a(Integer)
      end
    end

    describe "#rep_details" do
      it "returns rep details based on bill sponsors", :vcr do
        params = {
          id: 1722281
        }
        rep_data = BillSearchFacade.new(params).bill_sponsors

        expect(rep_data[0].first_name).to eq("Doug")
        expect(rep_data[0].last_name).to eq("Bankson")

      end

      it "returns rep details using new member facade", :vcr do
        params = {
          id: 1722281,
          state: "FL"
        }

        member_details = MemberSearchFacade.new(params).get_member_details
      end
    end
  end
end
