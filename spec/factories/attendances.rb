FactoryBot.define do
  factory :attendance do
    user {FactoryBot.create(:user)}  
    event {FactoryBot.create(:event)}
    stripe_customer_id {SecureRandom.urlsafe_base64}
  end
end
