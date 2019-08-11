class Product < ApplicationRecord
  has_many :product_warehouses, dependent: :destroy
  has_many :warehouses, through: :product_warehouses

  validates :sku_code, :name, :price, presence: true
  validates :sku_code, uniqueness: true, length: { is: 8 }
  validates :price, numericality: true

  accepts_nested_attributes_for :product_warehouses
end
