class MemberService
  def initialize(params)
    @state_abbv = params[:state]
    @bill_id = params[:id].to_i
  end


  def rep_details
    cache_key = "rep_details/#{@state_abbv}/#{@bill_id}"
    representatives = Rails.cache.fetch(cache_key) do
      response = os_conn.get("?") do |request|
                request.params['name'] = rep.last_name
                request.params['include'] = "other_names"
                request.params['jurisdiction'] = full_state
              end
              json = JSON.parse(response.body, symbolize_names: true)
              
              representatives[:sponsor_details] = json
      
              if json[:results].empty? && rep.last_name.downcase.include?('committee')
                json = {results: [{id: 0, name: "#{rep.last_name}}"}], pagination: {per_page:10, page: 1, max_page: 1, total_items: 0}}
              elsif json[:results].empty?
                response = os_conn.get("?") do |request|
                  request.params['name'] = rep.last_name.split.last.downcase
                  request.params['include'] = "other_names"
                  request.params['jurisdiction'] = full_state
                end
                json = JSON.parse(response.body, symbolize_names: true)
              end
    end
  end

  def os_conn
    Faraday.new("https://v3.openstates.org/people") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["STATES_KEY"]
      faraday.headers["accept"] = "application/json"
    end
  end
end


  
  