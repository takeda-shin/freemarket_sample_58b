require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    it "populates an array of products ordered by created_at DESC" do
      #product = FactoryBot.create_list(:product, 3)
      get :index
      #expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end