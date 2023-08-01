class BillSearchFacade
  def initialize(params)
    @params = params
  end

  def bills
    bill_search = BillService.new(@params).bills_by_query
    bill_objects = []
    bill_search[:searchresult].drop(1).map do |bill_data|
      bill_hash = {id: bill_data.first.to_s.to_i,
        attributes: bill_data.last }

        bill_objects << ApiBill.new(bill_hash)
        create_bill(bill_data.last)
    end
      bill_objects
  end

  def bill
    bill_search = BillService.new(@params).bills_by_id
    bill_hash = { id: bill_search[:bill][:bill_id],
      attributes: bill_search[:bill]
    }
    bill_object = ApiBill.new(bill_hash)
    create_bill(bill_search[:bill])
    bill_object
  end

  private
  def create_bill(bill_data)
    Bill.create!(
      bill_id: bill_data[:bill_id],
      bill_number: bill_data[:bill_number],
      text_url: bill_data[:text_url],
      last_action_date: bill_data[:last_action_date],
      last_action: bill_data[:last_action],
      title: bill_data[:title],
      state: bill_data[:state]
    )
  end

  def check_if_bill
  end
end

      # bill_search = BillService.new(@params).bills_by_id

      # state_abbv = bill_search[:bill][:state]
      # full_state = STATE_ABBR_TO_NAME[state_abbv]

      #   sponsor_array = bill_search[:bill][:sponsors].map do |sponsor|
      #     sponsor[:name]
      #   end
#   # if
# #     rep = Representative.find_by(name)
# #     else
# #       BillSearchFacade.rep_details
# #       rep.create
#         rep_search = BillService.new(@params).rep_details(full_state, sponsor_array)



#  if
#     rep = Representative.find_by(name)
#     else
#       BillSearchFacade.rep_details
#       rep.create


    # rep_array = bill_search[:bill][:attributes][:sponsors].map do |reps|
    #   reps[:name]
    # end

    # rep_search = BillService.new(@params).rep_details(rep_array)

    # bill_hash = { id: bill_search[:bill][:bill_id],
    #   attributes: { bill_search[:bill],
                  #  representatives: { rep_search[:data] }
                #  }
    # }
#    ApiBill.new(bill_hash)