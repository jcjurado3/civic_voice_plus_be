class Category < ApplicationRecord
  has_many :user_categories, dependent: :destroy 
end
