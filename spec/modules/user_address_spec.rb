require 'rails_helper'

describe UserAddress do
  describe '#create' do
    it "is invalid without a postal_code" do
      user_address = UserAddress.new(postal_code: "", prefectures: 3, city: "福岡市中央区", address: "天神1-1-1")
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("can't be blank")
    end
    it "is invalid without a prefectures" do
      user_address = UserAddress.new(postal_code: "123", prefectures: "", city: "福岡市中央区", address: "天神1-1-1")
      user_address.valid?
      expect(user_address.errors[:prefectures]).to include("can't be blank")
    end
    it "is invalid without a city" do
      user_address = UserAddress.new(postal_code: "123", prefectures: 3, city: "", address: "天神1-1-1")
      user_address.valid?
      expect(user_address.errors[:city]).to include("can't be blank")
    end
    it "is invalid without a address" do
      user_address = UserAddress.new(postal_code: "123", prefectures: 3, city: "福岡市中央区", address: "")
      user_address.valid?
      expect(user_address.errors[:address]).to include("can't be blank")
    end
  end
end