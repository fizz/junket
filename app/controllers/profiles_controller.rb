class ProfilesController < ApplicationController
  before_action :set_user
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # def index
  #   @profiles = Profile.all
  #   respond_with(@profiles)
  # end

  def show
    respond_with(@user, @profile)
  end

  def new
    @profile = @user.build_profile
    respond_with(@user, @profile)
  end

  def edit
  end

  def create
    @profile = @user.create_profile(profile_params)
    @profile.save
    respond_with(@user, @profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@user, @profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:bio, :user_id)
    end
end
