require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(sku_code: "01010101", name: "Test1", price: 33.50),
      Product.create!(sku_code: "12121212", name: "Test2", price: 93.25)
    ])
  end

  it "renders a list of products" do
    render
  end
end
