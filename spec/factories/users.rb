FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "maxime.speroni@yopmail.com" }    
    description {"Organisateur de parties fines"}
    password {'Bonjour'}
  end
end

