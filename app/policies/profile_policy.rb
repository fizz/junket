class ProfilePolicy < ApplicationPolicy
  def index?
    @user && (@user.profile == @record || @user.admin?)
  end

  def show?
    @user
  end

  def new?
    create?
  end

  def create?
    @user && (@record.user_id == @user.id || @user.admin?)
  end

  def update?
    @user && (@user.profile == @record || @user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    @user && (@user.profile == @record || @user.admin?)
  end
end
