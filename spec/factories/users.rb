FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "maxime.speroni@yopmail.com" }    
    description {"Organisateur de parties fines"}
    encrypted_password {SecureRandom.urlsafe_base64}
  end
end

