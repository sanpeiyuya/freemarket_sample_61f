class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new
    @users = User.all[0]
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
      @card = CreditCard.new(user_id: current_user,customer_id:customer_id ,card_id: customer.default_card)
      if @card.save
        redirect_to action:"show"
      else
        redirect_to card_index_path
      end
    end
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) if CreditCard.where(user_id: current_user.id).present?
  end
  

end
