class EmailNotification < ApplicationRecord
  validates :notification, presence: true, uniqueness: true
  validates :description, presence: true
end
