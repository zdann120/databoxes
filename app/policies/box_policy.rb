class BoxPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.public? || (record.user == user) || user.admin?
  end

  def new?
    create?
  end

  def create?
    show?
  end

  def update?
    show?
  end

  def destroy?
    user.admin?
  end

  def payload?
    (record.user == user) || user.admin? || record.public?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
