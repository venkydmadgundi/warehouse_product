FactoryBot.define do
  factory :product do
    name { "Product 1" }
    sku_code { "12345678"}
    price { rand(1..100) }

    trait :with_warehouses do
      association :business, factory: :business
    end

    trait :with_warehouses do
      product_warehouses do
        FactoryBot.create_list(:product_warehouse, 1, item_count, 5, low_item_threshold, PRODUCT_THRESHOLD)
      end
    end
    factory :valid_product, traits: [:with_warehouses]
  end
end
