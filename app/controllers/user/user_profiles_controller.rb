class User::UserProfilesController < User::BaseController
  def index
    @main_profile = current_user.main_profile
    @child_profiles = current_user.child_profiles
  end

  def new
    @user_profile = current_user.user_profiles.new(is_main_profile: params[:is_main_profile])
  end

  def create
    @user_profile = current_user.user_profiles.new(user_profile_params)
    if @user_profile.save
      flash[:success] = I18n.t('views.user.user_profile.create.success')
      redirect_to user_user_profiles_path
    else
      flash[:error] = I18n.t('views.user.user_profile.create.error')
      render 'new', status: 422
    end
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:is_main_profile, :firstname, :lastname, :gender, :grade, :club, :birthdate)
  end
end
