class ProductsController < ApplicationController
  
  def index
    @categorys = Product.where(category_id: 2).order("rand()").limit(5)
    @brands    = Product.where(brand_id: 6).order("rand()").limit(5)
  end

  def show
    @products = Product.find(params[:id])
    @brands = Brand.find(params[:id])
    @users = User.find(params[:id])
    @photos = Photo.where(product_id: params[:id])
  end

end
