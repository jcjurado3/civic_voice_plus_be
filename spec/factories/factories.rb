FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 2)}
  end
end