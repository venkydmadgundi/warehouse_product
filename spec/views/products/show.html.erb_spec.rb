require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(sku_code: "01010101", name: "Test1", price: 33.50))
  end

  it "renders attributes in <p>" do
    render
  end
end
