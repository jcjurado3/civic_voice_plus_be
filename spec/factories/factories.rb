FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 2)}
  end

  factory :state do
    abbv_name { Faker::Address.state_abbr }
  end

  factory :bill do
    bill_id { Faker::Number.number(digits: 7) }
    bill_number { Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 1, min_numeric: 3) }
    text_url { Faker::Internet.url(host: 'https://legiscan.com') }
    last_action_date { Faker::Date.between(from: 30.days.ago, to: Date.today)  }
    last_action { Faker::Subscription.status }
    title { Faker::Hipster.sentence }
    state { Faker::Address.state_abbr }
  end
end