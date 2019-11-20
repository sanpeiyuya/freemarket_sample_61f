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
      redirect_to new_credit_credit_cards_path
    else
    end
  end

  def complete
    @users = User.new
  end

  private
  def address_params
    params.require(:address).permit(:user_id, :postal_code, :prefecture_id, :city, :block, :building, :phone)
  end

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) if CreditCard.where(user_id: current_user.id).present?
  end

end
