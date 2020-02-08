require 'rails_helper'

describe CardInfosController do
  describe 'カード情報取得' do
    it "is invalid without a card_id" do
      product = FactoryBot.build(:product, price: 1200)
      card = FactoryBot.build(:card_info, card_id: "")
      card.valid?
    end
  end
end