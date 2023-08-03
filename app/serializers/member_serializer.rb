class MemberSerializer
  include JSONAPI::Serializer

  set_type :member
  set_id :id
  attributes  :first_name,
              :last_name,
              :email,
              :image_url,
              :full_name,
              :party
end