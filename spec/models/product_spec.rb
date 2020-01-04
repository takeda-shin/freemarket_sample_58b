require 'rails_helper'
describe Product do
  describe '#index' do
    it "is invalid without a image" do
      product = Product.new(name: "",image: "")
      product.valid?
      expect(product.errors[:image]).to include("can't be blank")
    end
  end
end