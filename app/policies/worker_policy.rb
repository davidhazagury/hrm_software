class WorkerPolicy < ApplicationPolicy
  # Only site admins adn HR Admins can CRUD Workers
  class Scope < Scope
    def resolve
      if (user.role? :admin) || (user.role? :hr_superadmin) || (user.role? :guest)
        scope.all
      end
    end
  end

  def new?
    (user.role? :admin) || (user.role? :hr_superadmin)
  end

  def create?
    (user.role? :admin) || (user.role? :hr_superadmin)
  end

  def edit?
    (user.role? :admin) || (user.role? :hr_superadmin)
  end

  def update?
    (user.role? :admin) || (user.role? :hr_superadmin)
  end

  def destroy?
    (user.role? :admin) || (user.role? :hr_superadmin)
  end
end
