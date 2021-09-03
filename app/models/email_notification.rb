class EmailNotification < ApplicationRecord
  validates :notification, presence: true, uniqueness: true
  validates :description, presence: true

  has_many :assign_email_notifications
  has_many :users, through: :assign_email_notifications
end
