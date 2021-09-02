class TypeOfShift < ApplicationRecord
  validates :name_of_shift, presence: true, uniqueness: true
end
