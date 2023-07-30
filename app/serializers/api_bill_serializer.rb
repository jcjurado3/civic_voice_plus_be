class ApiBillSerializer
  include JSONAPI::Serializer

  set_type :bill
  set_id :id
  attributes  :state,
              :bill_number,
              :bill_id,
              :text_url,
              :last_action_date,
              :last_action,
              :title,
              :status,
              :description,
              :sponsors
end