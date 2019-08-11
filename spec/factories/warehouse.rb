FactoryBot.define do
  factory :warehouse do
    name { "Warehouse 1" }
    wh_code { "12345678"}
    pincode {"410001"}
    max_capacity { rand(1..100) }
  end
end
