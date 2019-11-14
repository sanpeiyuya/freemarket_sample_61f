# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  def new_phone
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:password_confirmation] = params[:user][:password_confirmation]
    session[:family_name] = params[:user][:family_name]
    session[:given_name] = params[:user][:given_name]
    session[:family_name_kana] = params[:user][:family_name_kana]
    session[:given_name_kana] = params[:user][:given_name_kana]
    session[:birth_year] = params[:user][:birth_year]
    session[:birth_month] = params[:user][:birth_month]
    session[:birth_day] = params[:user][:birth_day]
    @user = User.new
  end

  def sns
    # sns先で使われている名前とメールアドレスをテキストボックスに入った状態をつくる
    @user = User.new(
      nickname:              session[:user_attributes]["nickname"],
      email:                 session[:user_attributes]["email"]
    )
  end
  
  def create
      @user = User.new(email:session[:email],password: session[:password], password_confirmation: session[:password_confirmation], phone: params[:user][:phone],nickname:session[:nickname],family_name: session[:family_name], given_name: session[:given_name], family_name_kana: session[:family_name_kana], given_name_kana: session[:given_name_kana], birth_year: session[:birth_year],birth_month: session[:birth_month],birth_day: session[:birth_day])
      if @user.save
        user = User.find_by(phone: params[:user][:phone])
        sns = SnsCredential.update(user_id: user.id)
        redirect_to new_address_users_path
        bypass_sign_in(@user)
      else
        redirect_to users_path
      end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
