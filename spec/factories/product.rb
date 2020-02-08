FactoryBot.define do
  factory :product do
    name  {"abe"}
    text {"text"}
    category_id {0}
    brand_id {0}
    price {0}
    product_size {"abe"}
    condition {"abe"}
    shipping_charge {"abe"}
    shipping_method {"abe"}
    delivery_area {"abe"}
    user_id {0}
    image {"hoge.png"}
    status {0}
    buyer_id {0}

    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end