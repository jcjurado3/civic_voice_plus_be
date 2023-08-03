class StateSerializer
  include JSONAPI::Serializer

  attributes  :state_abbr,
              :state_name
end