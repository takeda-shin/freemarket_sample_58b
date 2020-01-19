class MakingController < ApplicationController
  def index
    @products = Product.find(1)
    @brands = Brand.find(2)
    @users = User.find(1)
    @photos = Photo.all
    
  end

  def buy
  end
end