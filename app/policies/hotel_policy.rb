class HotelPolicy < ApplicationPolicy
  def index?
    @user && @user.hotels.include?(@record)
  end

  def show?
    true
  end

  def new?
    @user && @record.user_id == @user.id
  end

  def create?
    @user && @record.user_id == @user.id
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
