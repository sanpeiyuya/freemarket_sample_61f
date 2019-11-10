class UsersController < ApplicationController
  def index
    @user = User.new
  end
  
  def new_address
    @user = User.find_by(id: current_user.id)
    @address = Address.new
    @prefectures = Prefecture.all
  end

  def create_address
    @address =Address.new(address_params)
    if @address.save
      redirect_to new_credit_users_path
    else
    end
  end

  def new_credit
    @users = User.new
    @month = ['02','03','04','05','06','07','08','09','10','11','12']
  end

  def complete
    @users = User.new
  end

  private
  def address_params
    params.require(:address).permit(:user_id, :postal_code, :prefecture_id, :city, :block, :building, :phone)
  end

end
