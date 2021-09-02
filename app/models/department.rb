class Department < ApplicationRecord
  validates :name_of_department, presence: true, uniqueness: true
end
