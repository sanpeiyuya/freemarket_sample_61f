class UserNicknamesController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end
  def update
    @user = User.find(current_user.id)
    if @user.update(introduction_params)
      redirect_to mypages_path
    end
  end

  private
  def introduction_params
    params.require(:user).permit(:nickname, :introduction)
  end
end

