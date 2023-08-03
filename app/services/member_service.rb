class MemberService
  def initialize(params)
    @state_abbv = params[:state]
    @bill_id = params[:id].to_i
  end


  # def rep_details(full_state, sponsors)

  #   representatives = {}
  #   sponsors.each do |rep|

  #     representative = Member.where("members.full_name ILIKE ?", "%#{rep.first_name}%#{rep.last_name}%")

  #     if representative
  #       representatives[:full_name] = representative[0].full_name   
  #     else
  #       response = os_conn.get("?") do |request|
  #         request.params['name'] = rep.last_name
  #         request.params['include'] = "other_names"
  #         request.params['jurisdiction'] = full_state
  #       end
  #       json = JSON.parse(response.body, symbolize_names: true)
        
  #       representatives[:sponsor_details] = json

  #       if json[:results].empty? && rep.last_name.downcase.include?('committee')
  #         json = {results: [{id: 0, name: "#{rep.last_name}}"}], pagination: {per_page:10, page: 1, max_page: 1, total_items: 0}}
  #       elsif json[:results].empty?
  #         response = os_conn.get("?") do |request|
  #           request.params['name'] = rep.last_name.split.last.downcase
  #           request.params['include'] = "other_names"
  #           request.params['jurisdiction'] = full_state
  #         end
  #         json = JSON.parse(response.body, symbolize_names: true)
  #       end
  #     end
  #   end
  #   representatives
  # end

  def rep_details
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

  def os_conn
    Faraday.new("https://v3.openstates.org/people") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["STATES_KEY"]
      faraday.headers["accept"] = "application/json"
    end
  end
end