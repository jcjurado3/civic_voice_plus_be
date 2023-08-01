FactoryBot.define do
  factory :category do
    name { Faker::Commerce.department(max: 2)}
  end

  factory :state do
    abbv_name { Faker::Address.state_abbr }
  end

  factory :bill do
    bill_id { Faker::Number.number(digits: 7) }
    bill_number { "H" + Faker::Alphanumeric.alphanumeric(number: 4, min_alpha: 0, min_numeric: 4) }
    status {[0,1,2,3,4].sample}
    description { Faker::Hipster.sentence }
    state { Faker::Address.state_abbr }
    texts { [
      {
          "doc_id": 2726395,
          "url": "https://legiscan.com/FL/text/#{bill_number}/id/2726395"
      },
      {
          "doc_id": 2763446,
          "url": "https://legiscan.com/FL/text/#{bill_number}/id/2763446"
      }
    ] }
    sponsors { [
      {
        "name": "Chase Tramont",
        "ballotpedia": "Chase_Tramont"
      },
      {
        "name": "Christopher Benjamin",
        "knowwho_pid": 740304,
        "ballotpedia": "Christopher_Benjamin"
      }
    ]}
  end
end