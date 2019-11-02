class UserProfilesController < ApplicationController
  def edit
    @profile = UserProfile.find(current_user.id)
  end

  def update
    UserProfile.find(params[:id]).update(introduction_params)
  end

  private
  def introduction_params
    params.require(:user_profile).permit(:nickname, :introduction)
  end

end
