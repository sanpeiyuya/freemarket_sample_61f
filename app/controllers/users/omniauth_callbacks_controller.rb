# frozen_string_literal: true
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    callback_for :facebook
  end

  def google_oauth2
    callback_for :google
  end

  private

  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    # データベースに保存済みか確認
    if @user.persisted? #userが存在したら
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      # 新規登録
      session["devise.sns_id"] = sns_id
      session[:password] = @user.password
      session[:password_confirmation] = @user.password
      session[:user_attributes] = @user
      render "users/registrations/sns"
      # redirect_to users_sign_up_sns_path
    end

    def failure
      # コールバックにエラーが起きた場合、リダイレクトします
      redirect_to root_path
    end

  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
