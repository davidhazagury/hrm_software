class TypeOfPermission < ApplicationRecord
  validates :name_of_permission, presence: true, uniqueness: true
  belongs_to :permission
end
