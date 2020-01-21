class ExhibitionController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format| 
      format.html
      #{ redirect_to products_path(@product) }
      format.json
    end
  end

  def create
  end
end
