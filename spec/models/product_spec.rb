require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject { create :product }

    it "has a params sku_code, name and price is present" do
      product1 = build(:product, sku_code: "", name: "", price: "" )
      expect(product1).to_not be_valid
    end

    it "has a unique sku_code" do
      product = create(:product)
      product2 = build(:product, sku_code: "12345678")
      expect(product2).to_not be_valid
    end

    it "has a 8 character length sku_code" do
      product3 = build(:product, sku_code: "1234")
      expect(product3).to_not be_valid
    end

    it "has a numeric price" do
      product4 = build(:product, price: "hundred")
      expect(product4).to_not be_valid
    end

    it "is valid with valid attributes" do
      product5 = build(:product, sku_code: "23456789")
      expect(product5).to be_valid
    end
  end

end
