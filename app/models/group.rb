class Group < ApplicationRecord
  validates :type_of_group, presence: true, uniqueness: true
end
