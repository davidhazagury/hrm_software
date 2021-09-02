class Position < ApplicationRecord
  validates :name_of_position, presence: true, uniqueness: true
end
