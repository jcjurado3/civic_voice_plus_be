class BillSearchFacade
  def initialize(params)
    @params = params
  end

  def bills
    bill_search = BillService.new(@params).bills_by_query
    bill_objects = []
    bill_search[:searchresult].drop(1).each do |bill_data|
      bill_hash = {id: bill_data.first.to_s.to_i,
        attributes: bill_data.last }
        bill_object = ApiBill.new(bill_hash)
        bill_objects << bill_object
      
      create_update_bills(bill_data.last)
    end
      bill_objects
  end

  def bill
    bill_search = BillService.new(@params).bills_by_id
    bill_hash = { id: bill_search[:bill][:bill_id],
      attributes: bill_search[:bill]
    }
    bill_object = ApiBill.new(bill_hash)
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
  
  def create_update_bills(bill_data)
    bill1 = Bill.find_or_create_by(bill_id: bill_data[:bill_id]) do |b|
      b.bill_number = bill_data[:bill_number]
      b.text_url = bill_data[:text_url]
      b.last_action_date = bill_data[:last_action_date]
      b.last_action = bill_data[:last_action]
      b.title = bill_data[:title]
      b.state = bill_data[:state]
    end

    unless bill1.new_record?
      bill1.update(
        bill_number: bill_data[:bill_number],
        text_url: bill_data[:text_url],
        last_action_date: bill_data[:last_action_date],
        last_action: bill_data[:last_action],
        title: bill_data[:title],
        state: bill_data[:state]
      )
    end
  end
end

  
