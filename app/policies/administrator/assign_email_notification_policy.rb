class Administrator::AssignEmailNotificationPolicy < ApplicationPolicy
  # Only site admins can CRUD Assign Emails Notifications to Users
  class Scope < Scope
    def resolve
      if user.role? :admin
        scope.all
      end
    end
  end
  def index?
    user.role? :admin
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
