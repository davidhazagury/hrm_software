class TypeOfShift < ApplicationRecord
  validates :name_of_shift, presence: true, uniqueness: true
  has_many :user
end
