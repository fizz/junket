class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :authenticate_user!

  respond_to :html

  def index
    authorize @profile
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    authorize @profile
    respond_with(@user, @profile)
  end

  def new
    @profile = @user.build_profile
    authorize @profile
    respond_with(@user, @profile)
  end

  def edit
    authorize @profile
  end

  def create
    @profile = @user.create_profile(profile_params)
    authorize @profile
    @profile.save
    respond_with(@user, @profile)
  end

  def update
    authorize @profile
    @profile.update(profile_params)
    respond_with(@user, @profile)
  end

  def destroy
    authorize @profile
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
      params.require(:profile).permit(:bio, :user_id, :profile_pic)
    end
end
