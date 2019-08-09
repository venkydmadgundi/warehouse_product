class Warehouse < ApplicationRecord
  has_many :product_warehouses, dependent: :destroy
  has_many :products, through: :product_warehouses

  validates :wh_code, :name, :pincode, :max_capacity, presence: true
  validates :wh_code, uniqueness: true, length: { in: 4..16 }
  validates :max_capacity, numericality: { only_integer: {greater_than: 0} }

  def generate_warehouses_products(products, below_threshold=false)
    products.each do |product|
      count = below_threshold ? rand(1..PRODUCT_THRESHOLD-1) : rand(PRODUCT_THRESHOLD+1..100)
      product_warehouses.create!(product: product, item_count: count, low_item_threshold: PRODUCT_THRESHOLD)
    end
  end
end
