class ApiMemberSerializer
  include JSONAPI::Serializer

  set_type :meber
  set_id :id
  attributes  :first_name,
              :last_name
end