class Api::V1::BillsController < ApplicationController
  def index
    bill_sponsors = BillSearchFacade.new(params).bill_sponsors
    
    render json: ApiMemberSerializer.new(bill_sponsors)
  end

  def show
    member_details = MemberSearchFacade.new(params).get_member_details
  end
end
