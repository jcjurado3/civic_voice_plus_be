class UserStateSerializer
  include JSONAPI::Serializer

  attributes  :user_id,
              :state_id
end
