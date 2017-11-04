class Admin::UserProfilesController < AdminController
  def index
    @user_profiles = UserProfile.all.page params[:page]
  end
end
