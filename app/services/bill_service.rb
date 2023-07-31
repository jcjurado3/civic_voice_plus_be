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
  def rep_details(full_state, sponsors)
    representatives = {}
    sponsors.map do |rep|
      response = os_conn.get("?") do |request|
        request.params['name'] = rep
        request.params['include'] = "other_names"
        request.params['jurisdiction'] = full_state 
      end

    
      if response.body[:results].empty? && rep.include?('committee')
        json = {\"results\":[{id: 0, name: #{rep}}],\"pagination\":{\"per_page\":10,\"page\":1,\"max_page\":1,\"total_items\":0}}
      else
        response = os_conn.get("?") do |request|
          request.params['name'] = rep.split('').last
          request.params['include'] = "other_names"
          request.params['jurisdiction'] = full_state 
        end
        json = JSON.parse(response.body, symbolize_names: true)
        representatives[:sponsor_details] = json
      end

      json = JSON.parse(response.body, symbolize_names: true)
      representatives[:sponsor_details] = json
    end
    require 'pry'; binding.pry
  end
    
  def os_conn
    Faraday.new("https://v3.openstates.org/people") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["STATES_KEY"]
      faraday.headers["accept"] = "application/json"
    end
  end
end