class AssignEmailNotification < ApplicationRecord
  belongs_to :user
  belongs_to :email_notification
end
