 class BillService
  def initialize(params)
    @ops_action = params[:op]
    @state_abbv = params[:state]
    @query_keyword = params[:query]
    @bill_id = params[:id].to_i
  end

  def bills_by_query
    response = conn.get('?') do |request|
      request.params['key'] = ENV["LEGISCAN_KEY"]
      request.params['op'] = @ops_action
      request.params['state'] = @state_abbv
      request.params['query'] = @query_keyword
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def bills_by_id
    response = conn.get('?') do |request|
      request.params['key'] = ENV["LEGISCAN_KEY"]
      request.params['op'] = "getBill"
      request.params['id'] = @bill_id
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.legiscan.com/")
  end
end