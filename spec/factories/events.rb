FactoryBot.define do
  factory :event do
    start_date { "2019-02-15 11:34:32" }
    duration {30}
    title { "Dynamo vélo" }
    description { "Séance de vélo endiablée" }
    price {500}
    location {"Strasbourg" }
    admin {FactoryBot.create(:user)}
  end
end



