class Position < ApplicationRecord
  validates :name_of_position, presence: true, uniqueness: true
  has_many :workers
end
