class Api::V1::MembersController < ApplicationController
  def index
    bill_sponsors = BillSearchFacade.new(params).bill_sponsors
    
    render json: ApiMemberSerializer.new(bill_sponsors)
  end

  def show
    member_details = MemberSearchFacade.new(params).get_member_details
    render json: ApiMemberSerializer.new(member_details)
  end
end
