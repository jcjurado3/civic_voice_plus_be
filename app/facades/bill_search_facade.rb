class BillSearchFacade
  def initialize(params)
    @params = params
  end

  def bills
    bill_search = BillService.new(@params).bills_by_query
    bill_objects = []
    bill_search[:searchresult].drop(1).to_h.map do |bill_data|
      bill_hash = {id: bill_data.first.to_s.to_i,
      attributes: bill_data.last }

      bill_objects << ApiBill.new(bill_hash)
    end

    bill_objects
  end
end