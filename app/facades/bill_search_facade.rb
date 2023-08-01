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
        bill_object = ApiBill.new(bill_hash)
        bill_objects << bill_object
      require 'pry'; binding.pry
        #if Bill.find_by(bill_id: bill_object.bill_id)
    #     Bill.update
    # else
    #   require 'pry'; binding.pry
    #     create_bill(bill_data.last)

    end
      bill_objects
  end

  def bill
    bill_search = BillService.new(@params).bills_by_id
    bill_hash = { id: bill_search[:bill][:bill_id],
      attributes: bill_search[:bill]
    }
    bill_object = ApiBill.new(bill_hash)
    #update object
    #create_bill(bill_search[:bill])
    #pass updated object to controller
    bill_object
  end

  def bill_sponsors 

    bill_search = BillService.new(@params).bills_by_id

    bill_search[:bill][:sponsors].map do |sponsor|
      bill_hash = { first_name: sponsor[:first_name],
                  last_name: sponsor[:last_name] }
                  
      ApiMember.new(bill_hash)
    end
  end
  
  
  private
  
  def create_bill(bill_data)
    Bill.create!(
      bill_id: bill_data.bill_id,
      bill_number: bill_data.bill_number,
      text_url: bill_data.text_url,
      last_action_date: bill_data.last_action_date,
      last_action: bill_data.last_action,
      title: bill_data.title,
      state: bill_data.state
    )
  end

  def check_if_bill
    #if Bill.find_by(bill_id: bill_object.bill_id)
    #     Bill.update
    # else
    #   require 'pry'; binding.pry
    #     create_bill(bill_data.last)

  end
end

  
