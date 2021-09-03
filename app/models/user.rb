class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #We have turn on the timeout => which automatically logs the user out after 2 hours(set it by us), and the trackable
  #module to being able to track users.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :timeoutable

  has_many :assignments
  has_many :roles, through: :assignments
  has_many :assign_email_notifications
  has_many :email_notifications, through: :assign_email_notifications

  def role?(role)
    roles.any? { |r| r.role_name.underscore.to_sym == role }
  end
end
