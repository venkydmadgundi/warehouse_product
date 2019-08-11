require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "works! (now write some real specs)" do
      Product.create!(sku_code: "01010101", name: "Test1", price: 33.50)
      warehouse = Warehouse.create!(wh_code: 'warehouse', name: 'Warehouse', pincode: '000001', max_capacity: 1000)
      warehouse.generate_warehouses_products(Product.all)
      get products_path
      expect(response).to have_http_status(200)
    end
  end
end
