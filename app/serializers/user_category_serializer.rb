class UserCategorySerializer
  include JSONAPI::Serializer

  attributes  :user_id,
              :category_id
end
