class CardInfosController < ApplicationController

  require 'payjp'

  before_action :set_product, only: [:show, :purchase]
  before_action :set_card, only: [:show, :purchase]

  

  #購入確認画面
  def show
    #商品情報表示
    @brand = Brand.find(params[:id])
    @users = current_user
    @addresses = current_user.user_address

    #カード情報を取得
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "user", action: "edit"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  #カードの情報をpayjpに送り決済する
  def purchase
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    begin
    Payjp::Charge.create(
      amount: @product.price,
      customer: @card.customer_id,
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

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = CardInfo.find_by(user_id: current_user.id)
  end
  
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