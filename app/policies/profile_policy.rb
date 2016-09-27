class ProfilePolicy < ApplicationPolicy
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
    @user && @user.profile == @record
  end

  def edit?
    @user && @user.profile == @record
  end

  def destroy?
    @user && @user.profile == @record
  end

end
