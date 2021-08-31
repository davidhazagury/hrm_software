class Role < ApplicationRecord
  validates :role_name, presence: true, uniqueness: true
  has_many :assignments
  has_many :users, through: :assignments
end
