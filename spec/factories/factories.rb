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
          "people_id": 23332,
          "person_hash": "j9zna7tb",
          "party_id": "2",
          "state_id": 9,
          "party": "R",
          "role_id": 1,
          "role": "Rep",
          "name": "Chase Tramont",
          "first_name": "Chase",
          "middle_name": "",
          "last_name": "Tramont",
          "suffix": "",
          "nickname": "",
          "district": "HD-030",
          "ftm_eid": 55866659,
          "votesmart_id": 209394,
          "opensecrets_id": "",
          "knowwho_pid": 0,
          "ballotpedia": "Chase_Tramont",
          "bioguide_id": "",
          "sponsor_type_id": 1,
          "sponsor_order": 2,
          "committee_sponsor": 0,
          "committee_id": 0,
          "state_federal": 0
      },
      {
        "people_id": 22528,
        "person_hash": "1y03g0zp",
        "party_id": "1",
        "state_id": 9,
        "party": "D",
        "role_id": 1,
        "role": "Rep",
        "name": "Christopher Benjamin",
        "first_name": "Christopher",
        "middle_name": "",
        "last_name": "Benjamin",
        "suffix": "",
        "nickname": "",
        "district": "HD-107",
        "ftm_eid": 49845730,
        "votesmart_id": 194464,
        "opensecrets_id": "",
        "knowwho_pid": 740304,
        "ballotpedia": "Christopher_Benjamin",
        "bioguide_id": "",
        "sponsor_type_id": 2,
        "sponsor_order": 3,
        "committee_sponsor": 0,
        "committee_id": 0,
        "state_federal": 0
    }
    ]}
  end
end