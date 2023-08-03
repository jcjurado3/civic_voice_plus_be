class BillService
  def initialize(params)
    @state_abbv = params[:state]
    @query_keyword = params[:query]
    @bill_id = params[:id].to_i
  end

  def bills_by_query
    bills_key = ["bills_by_query", @state_abbv, @query_keyword]
    response = Rails.cache.fetch(bills_key) do
      fetch_bills_by_query_from_api
    end
    json = JSON.parse(response.body, symbolize_names: true)
    bill_search_result = json[:searchresult]

    json
  end

  def bills_by_id
    response = ls_conn.get('?') do |request|
      request.params['key'] = ENV["LEGISCAN_KEY"]
      request.params['op'] = "getBill"
      request.params['id'] = @bill_id
    end

    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def fetch_bills_by_query_from_api
    ls_conn.get('?') do |request|
      request.params['key'] = ENV["LEGISCAN_KEY"]
      request.params['op'] = "getSearch"
      request.params['state'] = @state_abbv
      request.params['query'] = @query_keyword
    end
  end

  def ls_conn
    Faraday.new("https://api.legiscan.com/")
  end 
end