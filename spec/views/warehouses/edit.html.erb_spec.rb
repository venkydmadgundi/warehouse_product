require 'rails_helper'

RSpec.describe "warehouses/edit", type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!({wh_code: "1234", name: "Test1", pincode: "123445", max_capacity: 100}))
  end

  it "renders the edit warehouse form" do
    render

    assert_select "form[action=?][method=?]", warehouse_path(@warehouse), "post" do
    end
  end
end
