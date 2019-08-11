require 'rails_helper'

RSpec.describe "warehouses/show", type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!({wh_code: "1234", name: "Test1", pincode: "123445", max_capacity: 100}))
  end

  it "renders attributes in <p>" do
    render
  end
end
