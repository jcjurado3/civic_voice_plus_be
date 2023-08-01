class BillService
  def initialize(params)
    @state_abbv = params[:state]
    @query_keyword = params[:query]
    @bill_id = params[:id].to_i
  end

  def bills_by_query
    response = ls_conn.get('?') do |request|
      request.params['key'] = ENV["LEGISCAN_KEY"]
      request.params['op'] = "getSearch"
      request.params['state'] = @state_abbv
      request.params['query'] = @query_keyword
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def bills_by_id
    response = ls_conn.get('?') do |request|
      request.params['key'] = ENV["LEGISCAN_KEY"]
      request.params['op'] = "getBill"
      request.params['id'] = @bill_id
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def ls_conn
    Faraday.new("https://api.legiscan.com/")
  end

  # def rep_details(rep_array)
  #   all_sponsors =  rep_array.map do |rep_name|
  #     response = os_conn.get("/people") do |request|
  #       request.params['jurisdiction'] = @___ #state abbv turned into full state string
  #       request.params['name'] = @___ #bill sponser's mapped out, search by "name"
  #       request.params['include'] = "other_names"
  #     end
  #   end

  #   json = JSON.parse(response.body, symbolize_names: true)
  # end
  
end