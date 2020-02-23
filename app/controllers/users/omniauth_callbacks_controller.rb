# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)
    @omniauth = request.env['omniauth.auth']
    info = User.find_oauth(@omniauth)
    @user = info[:user]
    if @user.persisted? 
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else 
      @sns = info[:sns]
      session[:password_confirmation] = SecureRandom.alphanumeric(30)
      # render template: "devise/registrations/new" 
      if SnsCredential.find_by(uid: info[:sns][:uid], provider: info[:sns][:provider]).nil?
        #ユーザ登録と同時にsns_credentialも登録するために
        session[:uid] = info[:sns][:uid]
        session[:provider] = info[:sns][:provider]
      end
      #登録フォームのviewにリダイレクトさせる
      render template: "signup/step1" 

    end
  end

  def failure
    redirect_to root_path and return
  end
end
