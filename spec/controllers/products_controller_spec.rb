require 'rails_helper'

describe ProductsController do
  describe '商品一覧画面' do
    it "商品一覧を表示する" do
      product = FactoryBot.create_list(:product, 3)
      get :index
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end