class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :authenticate_user!

  respond_to :html

  def index
    authorize @hotel
    @hotels = Hotel.all
    respond_with(@hotels)
  end

  def show
    authorize @hotel
    respond_with(@user, @hotel)
  end

  def new
    @hotel = @user.hotels.build
    authorize @hotel
    respond_with(@user, @hotel)
  end

  def edit
    authorize @hotel
  end

  def create
    @hotel = @user.hotels.create(hotel_params)
    authorize @hotel
    @hotel.save
    respond_with(@user, @hotel)
  end

  def update
    authorize @hotel
    @hotel.update(hotel_params)
    respond_with(@user, @hotel)
  end

  def destroy
    authorize @hotel
    @hotel.destroy
    respond_with(@hotel)
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :address_1, :address_2, :city, :region, :zip_code, :country, :description, :user_id, :hotel_pic)
    end
end
