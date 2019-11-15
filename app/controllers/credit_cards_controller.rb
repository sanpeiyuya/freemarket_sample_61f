class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def new
    gon.payjp_key = ENV["PAYJP_PRIVATE_KEY"]
    card = CreditCard.find_by(user_id: current_user.id)
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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

  def buy
    
    card = CreditCard.find_by(user_id: current_user.id)
    @display_item = DisplayItem.find(params[:trading_item][:display_item_id])
    @address = Address.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      if Payjp::Charge.create(
        amount: @display_item.price,
        customer: card.customer_id,
        currency: 'jpy',
        )
        @display_item.update(user_id: current_user.id)
        
        @trading_item = TradingItem.new(trading_item_params)
        if @trading_item.save
          redirect_to root_path
        end
      end
    end
  end


  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id) if CreditCard.where(user_id: current_user.id).present?
  end

  def trading_item_params
    params.require(:trading_item).permit(:user_id, :display_item_id)
  end
end
