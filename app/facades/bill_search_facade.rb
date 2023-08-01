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
    bill_search = BillService.new(@params).bills_by_id
    bill_hash = { id: bill_search[:bill][:bill_id],
      attributes: bill_search[:bill]
    }
    ApiBill.new(bill_hash)
  end

  def bill_sponsors
    bill_search = BillService.new(@params).bills_by_id

    bill_search[:bill][:sponsors].map do |sponsor|
      bill_hash = { first_name: sponsor[:first_name],
                    last_name: sponsor[:last_name] }
                    
      ApiMember.new(bill_hash)
    end
  end
end

  
