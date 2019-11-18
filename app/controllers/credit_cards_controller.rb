class CreditCardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
  end

  def show
    if @card.present?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      # 登録しているカード会社のブランドアイコンを表示する
      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    end
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
        redirect_to root_path
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
        
        
        @trading_item = TradingItem.new(trading_item_params)
        if @trading_item.save
          redirect_to root_path
        end
      end
    end
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)

    #削除に成功した時にポップアップを表示します。
    if @card.destroy 
      customer.delete
      redirect_to mypages_path
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "show", alert: "削除できませんでした"
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
