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
      end
      
      bill_objects
    end
    
    def bill
      # bill_search = BillService.new(@params).bills_by_id
      # bill_hash = { id: bill_search[:bill][:bill_id],
      #   attributes: bill_search[:bill]
      # }
      # ApiBill.new(bill_hash)
    
      bill_search = BillService.new(@params).bills_by_id
      
      state_abbv = bill_search[:bill][:state]
      full_state = STATE_ABBR_TO_NAME[state_abbv]




        sponsor_array = bill_search[:bill][:sponsors].map do |sponsor|
          sponsor[:name]
        end

        rep_search = BillService.new(@params).rep_details(full_state, sponsor_array)
    end
  end






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