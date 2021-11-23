class EmployeePolicy < ApplicationPolicy
  # Only site admins adn HR Admins can CUD Workers
  #Show is allow for all types of users
  class Scope < Scope
  end
  def index?
    (user.role? :admin) || (user.role? :hr_superadmin)
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

  def show?
    true
  end
# DO WE NEED TO VERIFY FIRST (BEFORE_ACTION) THE USER IS CHECKING ITS COMPANY?
end
