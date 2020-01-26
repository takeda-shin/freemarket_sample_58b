class ExhibitionController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format| 
      format.html
      format.json
    end
  end

  def create
  end
end
