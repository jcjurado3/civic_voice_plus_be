class Bill < ApplicationRecord
  has_many :user_bills
  serialize :sponsors, Array
  serialize :texts, Array
end
