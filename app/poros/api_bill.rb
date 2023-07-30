class ApiBill
  attr_reader :id,
              :state,
              :bill_number,
              :bill_id,
              :text_url,
              :last_action_date,
              :last_action,
              :title,
              :status,
              :description,
              :sponsors

  def initialize(data)
    @id = data[:id]
    @state = data[:attributes][:state]
    @bill_number = data[:attributes][:bill_number]
    @bill_id = data[:attributes][:bill_id]
    @text_url = data[:attributes][:text_url]
    @last_action_date = data[:attributes][:last_action_date]
    @last_action = data[:attributes][:last_action]
    @title = data[:attributes][:title]
    @status = data[:attributes][:status]
    @description = data[:attributes][:description]
    @sponsors = data[:attributes][:sponsors]
  end
end