class ProductsController < ApplicationController
  
  def index
    @categorys = Product.where(category_id: 2).order("price DESC").limit(5)
    @brands    = Product.where(brand_id: 3).order("rand()").limit(5)
  end

  def show
  end

end
