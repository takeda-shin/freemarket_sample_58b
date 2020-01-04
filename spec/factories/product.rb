FactoryBot.define do
  factory :product do
    #name  {"abe"}
    image {"hoge.png"}
    #sequence(:image) {Faker::Internet.image}
    #created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end