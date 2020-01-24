class SignupController < ApplicationController

  before_action :save_step1_to_session, only: :step2_1
  before_action :save_step2_1_to_session, only: :sms_post
  before_action :save_step3_to_session, only: :step4
  before_action :save_step4_to_session, only: :create

  def step1
    @user = User.new
    @user.build_user_address
    @user.build_card_info
  end
  #以下バリデーション
  def save_step1_to_session

    params[:user][:birthday] = birthday_join
    @user = User.new(user_params)
    session[:user_params] = user_params

    render '/signup/step1' unless @user.valid?
  end 

  def step2_1
    @user = User.new
    @user.build_user_address
    @user.build_card_info
  end
  #以下バリデーション
  def save_step2_1_to_session
    session[:phone_number] = user_params[:phone_number]
    session[:user_params_after_step2_1] = user_params
    session[:user_params_after_step2_1].merge!(session[:user_params])
    @user = User.new
    render '/signup/step2_1' unless session[:user_params_after_step2_1][:phone_number].present?
  end 

  def step2_2
    @user = User.new
    @user.build_user_address
    @user.build_card_info
  end

  def step3
    @user = User.new
    @user.build_user_address
    @user.build_card_info
  end

  def save_step3_to_session
    session[:user_address_after_step3] = user_params[:user_address_attributes]
    @user = User.new
    @user.build_user_address
    render '/signup/step3' unless session[:user_address_after_step3][:postal_code].present?
  end 

  def step4
    @user = User.new
    @user.build_user_address
    @user.build_card_info
  end
  #以下バリデーション
  def save_step4_to_session
    session[:user_address_after_step4] = user_params[:card_info_attributes]
    @user = User.new
    @user.build_card_info
    render '/signup/step4' unless session[:user_address_after_step4][:use_limit_month].present?
  end 

  def create
    @user = User.new(session[:user_params_after_step2_1])
    @user.build_user_address(session[:user_address_after_step3])
    @user.build_card_info(user_params[:card_info_attributes])

    if @user.save
      session[:id] = @user.id
      redirect_to finish_signup_index_path
    else
      render '/signup/index/'
    end
  end

  def finish
    sign_in User.find(session[:id]) unless user_signed_in?
  end
  
  # SMS認証
  def sms_post
    @user = User.new
    phone_number_original = user_params[:phone_number]
    phone_number = PhonyRails.normalize_number phone_number_original, country_code:'JP'
    sms_number = rand(100000..999999)
    session[:sms_number] = sms_number
    client = Twilio::REST::Client.new
    begin
      result = client.messages.create(
        from: Rails.application.credentials.twilio[:TWILIO_PHONE_NUMBER],
        to:   phone_number,
        body: "認証番号：#{session[:sms_number]} この番号を認証画面に入力してください。"
      )
    rescue
      render "signup/step2_1"
      return false
    end
    redirect_to step2_2_signup_index_path
  end

  def sms_check
    @user = User.new
    sms_number = user_params[:phone_number]
    if sms_number.to_i == session[:sms_number]
      redirect_to step3_signup_index_path
    else
      render "signup/step2_2"
    end
  end

  private

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

    def birthday_join
      date = params[:birthday]

      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      end

      Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    end
end
