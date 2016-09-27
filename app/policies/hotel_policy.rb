class HotelPolicy < ApplicationPolicy
  def index?
    @user
  end

  def show?
    @user
  end

  def new?
    @user
  end

  def create?
    @user
  end

  def update?
    @user && @user.hotels.include?(@record)
  end

  def edit?
    @user && @user.hotels.include?(@record)
  end

  def destroy?
    @user && @user.hotels.include?(@record)
  end
end
