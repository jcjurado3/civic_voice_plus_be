class MemberSearchFacade
  def initialize(params)
    @params = params
    @state = params[:state]
  end

  # def get_member_details
  #   bill_sponsors = BillSearchFacade.new(@params).bill_sponsors
  #   sponsor_details = MemberService.new(@params).rep_details(@state, bill_sponsors)
  #   sponsor_response = sponsor_details[:sponsor_details][:results]
  #   sponsor_response.map do |sponsor|
  #     sponsor_hash = {
  #     full_name: sponsor[:name],
  #     image_url: sponsor[:image],
  #     party: sponsor[:party]
  #     }
  #   member = Member.new(sponsor_hash)
  #   end
  
  def get_member_details
    representatives = []
    bill_sponsors = BillSearchFacade.new(@params).bill_sponsors
    bill_sponsors.each do |rep|

      representative = Member.where("members.full_name ILIKE ?", "%#{rep.first_name}%#{rep.last_name}%")

      if representative
        representatives << representative
      else
        sponsor_details = MemberService.new(@params).rep_details(@state, bill_sponsors)
        sponsor_response = sponsor_details[:sponsor_details][:results]
        sponsor_response.map do |sponsor|
          sponsor_hash = {
          full_name: sponsor[:name],
          image_url: sponsor[:image],
          party: sponsor[:party]
          }
          member = Member.new(sponsor_hash)
        end
      end
      representatives
    end
  end
end