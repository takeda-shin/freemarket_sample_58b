class CardInfosController < ApplicationController

  require 'payjp'
  

  #購入確認画面
  def show
    #商品情報表示
    @products = Product.find(params[:id])
    @brands = Brand.find(params[:id])
    @photos = Photo.where(product_id: params[:id])
    @users = User.find(current_user.id)
    @addresses = UserAddress.where(user_id: current_user.id)

    #カード情報を取得
    card = CardInfo.where(user_id: current_user.id).first
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "user", action: "edit"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  #カードの情報をpayjpに送り決済する
  def purchase
    card = CardInfo.where(user_id: current_user.id).first
    @product = Product.where(params[:id]).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    begin
    Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
      currency: 'jpy'
    )
    rescue
      redirect_to action: 'show'
      return false
    end
      if @product.update(status: 1, buyer_id: current_user.id)
        redirect_to done_card_info_path
      else
        redirect_to card_info_path
      end
  end

  def done
  end

  private
  
  def purchase_params
    params.permit(
      :name, 
      :image, 
      :text, 
      :category_id, 
      :brand_id, 
      :condition, 
      :product_size, 
      :shipping_charge, 
      :shipping_method, 
      :delivery_area, 
      :price,
      :buyer_id,
      :status
      )  
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birthday,
      :phone_number,
      :profile,
      user_address_attributes:[
        :user_id,
        :postal_code,
        :prefectures,
        :city,
        :address,
        :building
      ],
      card_info_attributes:[
        :user_id,
        :card_number,
        :use_limit_month,
        :use_limit_year,
        :security_code
      ]
    )
  end
end
