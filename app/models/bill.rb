class Bill < ApplicationRecord
  has_many :user_bills, dependent: :destroy 
  serialize :sponsors, Array
  serialize :texts, Array
end
