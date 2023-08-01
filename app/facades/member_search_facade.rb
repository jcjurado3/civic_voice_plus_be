class MemberSearchFacade
  def initialize(params)
    @params = params
    @state = params[:state]
  end

  def get_member_details
    bill_sponsors = BillSearchFacade.new(@params).bill_sponsors
    sponsor_details = MemberService.new(@params).rep_details(@state, bill_sponsors)
    sponsor_response = sponsor_details[:sponsor_details][:results]
    sponsor_response.map do |sponsor|
      sponsor_hash = {
        
      }
    end
    member = Member.new(sponsor_hash)
    require 'pry'; binding.pry
  end
end