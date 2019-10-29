class UserProfilesController < ApplicationController
  def edit
    @profile = UserProfile.find(1)
  end
  def update
  end
end
