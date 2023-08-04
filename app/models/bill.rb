class Bill < ApplicationRecord
  has_many :user_bills, dependent: :destroy 
  serialize :sponsors, Array
  serialize :texts, Array

  self.per_page = 8
end
