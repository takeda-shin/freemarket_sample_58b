class ProductsController < ApplicationController
  
  def index
    @categorys = Product.where(category_id: 6).order("rand()").limit(5)
    @brands    = Product.where(brand_id: 2).order("rand()").limit(5)
  end

  def show
    @products = Product.find(params[:id])
    @brands = Brand.find(params[:id])
    @users = User.find(params[:id])
    @photos = Photo.where(product_id: params[:id])
  end

  def create
    @products = Product.all
    @categories = Category.all
    Product.create(product_params)
    respond_to do |format| 
      format.html
      format.json
    end
    
  end

  private
  def product_params
    params.permit(:name, :image, :text, :category_id, :condition, :product_size, :shipping_charge,:shipping_method, :delivery_area,:price)  
  end

end
