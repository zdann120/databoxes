class DatumPolicy < ApplicationPolicy
  def show?
    (record.box.user == user) || user.try(:admin?) || record.box.public?
  end

  def payload?
    (record.box.user == user) || user.try(:admin?) || record.box.public?
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
