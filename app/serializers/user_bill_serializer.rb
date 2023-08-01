class UserBillSerializer
  include JSONAPI::Serializer

  attributes  :user_id,
              :bill_id
end