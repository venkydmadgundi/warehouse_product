require 'rails_helper'

RSpec.describe "warehouses/index", type: :view do
  before(:each) do
    assign(:warehouses, [
      Warehouse.create!({wh_code: "1234", name: "Test1", pincode: "123456", max_capacity: 100}),
      Warehouse.create!({wh_code: "5678", name: "Test2", pincode: "234567", max_capacity: 500})
    ])
  end

  it "renders a list of warehouses" do
    render
  end
end
