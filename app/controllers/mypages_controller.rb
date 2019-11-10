class MypagesController < ApplicationController
  def index
    # @profile = UserProfile.find_by(user_id: current_user.id)
    @display_item = DisplayItem.new
  end

  def display_items
    @display_item = DisplayItem.all
  end

  def trading_items
  end

  def finished_items
  end

  def logout
    @display_item = DisplayItem.new
  end
  
end
