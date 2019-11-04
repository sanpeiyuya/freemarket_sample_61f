class UsersController < ApplicationController
  def index
  end
  
  def new_info
  end

  def new
  end

  def new_phone
    @users = User.new
  end
end
