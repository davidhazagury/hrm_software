class User < ApplicationRecord
  after_create :assign_user_to_email_notifications
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :roles, presence: true
  validates :company, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #We have turn on the timeout => which automatically logs the user out after 2 hours(set it by us), and the trackable
  #module to being able to track users.
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :confirmable, :registerable

  has_many :assignments
  has_many :roles, through: :assignments
  has_many :assign_email_notifications
  has_many :email_notifications, through: :assign_email_notifications
  belongs_to :company
  def role?(role)
    roles.any? { |r| r.role_name.underscore.to_sym == role }
  end

  def set_users_password
    number_chain = []
    5.times do
      number_chain.push((0...9).to_a.sample())
    end
    return "#{first_name}#{number_chain.join("")}"
  end

  private
  # After the site admin has created a new user, we want to assign all types of email notifications to that user, so that
  # all email notifications are deactivated and we will choose which ones should have activated after.
  def assign_user_to_email_notifications
    # For each type of notification, we want to create an assignEmailNotification active = false for that user.
    # First we make sure EmailNotification doesn't return an empty array
    if !EmailNotification.all.empty?
      EmailNotification.all.each do |en|
        # For each type of email notification we assign it to a user, with active=false (is by default that state)
        AssignEmailNotification.create(user_id: self.id, email_notification_id: en.id)
      end
    end
  end
 # We want the user to set its password after the email is confirmed
  def password_required?
    confirmed? ? super : false
  end
end
