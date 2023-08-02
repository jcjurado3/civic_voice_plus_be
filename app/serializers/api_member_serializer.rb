class ApiMemberSerializer
  include JSONAPI::Serializer

  set_type :member
  set_id :id
  attributes  :first_name,
              :last_name, 
              :full_name,
              :image_url
end