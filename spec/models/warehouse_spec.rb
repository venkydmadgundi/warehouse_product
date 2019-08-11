require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'Validations' do
    subject { create :warehouse }

    it "is valid with valid attributes" do
      warehouse4 = build(:warehouse, wh_code: "56789")
      expect(warehouse4).to be_valid
    end

    it "has a params wh_code, name, pincode and max_capacity is present" do
      warehouse1 = build(:warehouse, wh_code: "", name: "", pincode: "", max_capacity: "" )
      expect(warehouse1).to_not be_valid
    end

    it "has a unique wh_code" do
      warehouse1 = create(:warehouse)
      warehouse2 = build(:warehouse, wh_code: "12345678")
      expect(warehouse2).to_not be_valid
    end

    it "has a numeric max_capacity" do
      warehouse3 = build(:warehouse, max_capacity: -12.45)
      expect(warehouse3).to_not be_valid
    end
  end

end
