class CreditCardsController < ApplicationController

  def index
  end

  def new
    @users = User.all[0]
  end

  def creat
    redirect_to root_path
  end

end
