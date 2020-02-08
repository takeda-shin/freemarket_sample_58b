FactoryBot.define do
  factory :card_info do
    user_id  {1}
    customer_id {"cus_014d16337815c8db3aece962d89b"}
    card_id {"cus_014d16337815c8db3aece962d89b"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end