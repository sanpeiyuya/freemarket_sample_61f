class UserProfilesController < ApplicationController
  def edit
    @profile = UserProfile.find(1)
  end
  def update
    binding.pry
    UserProfile.find(params[:id]).update(introduction_params)
  end

  private
  def introduction_params
    params.require(:uesr_profile).permit(:introduction)
  end
end
