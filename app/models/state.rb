class State < ApplicationRecord
  has_many :user_states, dependent: :destroy
end
