class HotelPolicy < ApplicationPolicy
  def index?
    @user.admin? || @record.user_id == @user.id
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    @user && (@record.user_id == @user.id || @user.admin?)
  end

  def update?
    @user && (@user.hotels.include?(@record) || @user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    @user && (@user.hotels.include?(@record) || @user.admin?)
  end
end
