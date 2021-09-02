class Administrator::CompanyPolicy < ApplicationPolicy
  # Only site admins can CRUD Companies
  class Scope < Scope
    def resolve
      if user.role? :admin
        scope.all
      end
    end
  end
  def new?
    user.role? :admin
  end
  def create?
    user.role? :admin
  end

  def edit?
    user.role? :admin
  end

  def update?
    user.role? :admin
  end

  def destroy?
    user.role? :admin
  end
end
