class RoomTypesController < ApplicationController
  before_action :set_room_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @room_types = RoomType.all
    respond_with(@room_types)
  end

  def show
    respond_with(@room_type)
  end

  def new
    @room_type = RoomType.new
    respond_with(@room_type)
  end

  def edit
  end

  def create
    @room_type = RoomType.new(room_type_params)
    @room_type.save
    respond_with(@room_type)
  end

  def update
    @room_type.update(room_type_params)
    respond_with(@room_type)
  end

  def destroy
    @room_type.destroy
    respond_with(@room_type)
  end

  private
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    def room_type_params
      params.require(:room_type).permit(:name, :capacity)
    end
end
