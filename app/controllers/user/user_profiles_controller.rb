class User::UserProfilesController < User::BaseController

  before_action :find_user_profile, only: [:edit, :update, :toggle_disabled]

  def index
    @main_profile = current_user.main_profile
    @child_profiles = current_user.child_profiles.enabled
    @disabled_child_profiles = current_user.child_profiles.disabled
  end

  def new
    @user_profile = current_user.user_profiles.new(is_main_profile: params[:is_main_profile])
  end

  def create
    @user_profile = current_user.user_profiles.new(user_profile_params)
    if @user_profile.save
      flash[:success] = t('.success')
      redirect_to user_user_profiles_path
    else
      flash[:error] = t('.error')
      render 'new', status: 422
    end
  end

  def edit
  end

  def update
    if @user_profile.update(user_profile_params)
      flash[:success] = t('.success')
      redirect_to user_user_profiles_path
    else
      flash[:error] = t('.error')
      render 'edit', status: 422
    end
  end

  def toggle_disabled
    if @user_profile.toggle!(:disabled)
      flash[:success] = t(".success_#{@user_profile.disabled?}")
    else
      flash[:error] =  t(".error_#{@user_profile.disabled?}")
    end
    redirect_to user_user_profiles_path()
  end

  private

  def find_user_profile
    @user_profile = current_user.user_profiles.find(params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:is_main_profile, :firstname, :lastname, :gender, :grade, :club, :birthdate)
  end
end
