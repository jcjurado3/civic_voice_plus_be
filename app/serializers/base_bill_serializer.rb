class BaseBillSerializer
  include JSONAPI::Serializer

  set_type :bill
  set_id :id
  attributes  :bill_number,
              :bill_id,
              :description,
              :sponsors,
              :state,
              :status,
              :texts
end