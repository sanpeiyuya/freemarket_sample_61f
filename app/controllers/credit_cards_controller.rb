class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new
    @users = User.all[0]
    card = CreditCard.find_by(user_id: current_user.id)
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
    if params['payjp-token'].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        card: params['payjp-token'],
        metadata:{user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id,customer_id:customer.id ,card_id: customer.default_card)
      if @card.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def show


  end


  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) if CreditCard.where(user_id: current_user.id).present?
  end
  

end
