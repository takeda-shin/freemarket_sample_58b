class ProductsController < ApplicationController
  
  def index
    @categorys = Product.where(category_id: 2).order("rand()").limit(5)
    @brands    = Product.where(brand_id: 6).order("rand()").limit(5)
  end

  def show
  end

end
