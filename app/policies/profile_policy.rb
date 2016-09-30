class ProfilePolicy < ApplicationPolicy
  def index?
    @user && @user.profile == @record
  end

  def show?
    @user
  end

  def new?
    @user && @record.user_id == @user.id
  end

  def create?
    @user && @record.user_id == @user.id
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
