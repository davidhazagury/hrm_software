class Alert < ApplicationRecord
  validates :name_of_alert, presence: true, uniqueness: true
  validates :description, presence: true
end
