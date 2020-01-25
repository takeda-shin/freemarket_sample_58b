class ProductsController < ApplicationController
  
  def index
  end

  def show
    @products = Product.find(params[:id])
    @brands = Brand.find(params[:id])
    @users = User.find(params[:id])
    @photos = Photo.where(product_id: params[:id])
  end

end
