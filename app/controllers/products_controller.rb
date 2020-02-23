class ProductsController < ApplicationController


  before_action :set_product, only: [:edit, :update, :show, :destroy, :details]
  
  def index
    @categories  = Product.all.limit(5)
    @brands      = Product.all.limit(5)
    @photos      = Photo.all
  end

  def show

  end

  def new
    @product = Product.new
    @product.photos.build
    @products = Product.all
    @categories = Category.all
    @conditions = Condition.all
    @shipping_charges = ShippingCharge.all
    @delivery_areas = DeliveryArea.all
    @shipping_methods = ShippingMethod.all
  end

  def create
    @product = Product.new(product_params)
    @photo = @product.photos.build(photo_params)
    @photo.product_id = @product.id
    if @product.save && @photo.save
      redirect_to action: :index, notice: '商品情報を編集しました'
    else
      flash[:alert] = '編集に失敗しました。必須項目を確認してください。'
      redirect_to root_path
    end
  end

  def edit
    @product.photos.build
    @products = Product.all
    @categories = Category.all
    @conditions = Condition.all
    @shipping_charges = ShippingCharge.all
    @delivery_areas = DeliveryArea.all
    @shipping_methods = ShippingMethod.all
  end

  def update
    @product.update(product_params)
    redirect_to action: :index
  end

  def details
    
  end

  def destroy
    if @product.destroy
       redirect_to root_path

    else
      redirect_to action: "details"
    end
  end

  private
  def set_product
    brand_id = Product.find(params[:id]).brand_id
    user_id  = Product.find(params[:id]).user_id
    @product = Product.find(params[:id])
    if brand_id
      @brand   = Brand.find(brand_id)
    else
      @brand  = Brand.new
    end
    @user    = User.find(user_id)
    @photos  = Photo.where(product_id: params[:id])
  end

  def product_params
    if user_signed_in?
      @user_id = current_user.id
    else
      @user_id = 1
    end
    params.require(:product).permit(:name, :text, :category_id, :brand_id, :condition,:shipping_charge, :product_size, :shipping_method, :delivery_area, :price).merge(user_id: @user_id)
  end

  def photo_params
    params.require(:product).permit(:image_url)
  end

end
