class WorkCenter < ApplicationRecord
  validates :name_of_work_center, presence: true, uniqueness: true
end