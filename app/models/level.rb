class Level < ApplicationRecord
  validates :type_of_level, presence: true, uniqueness: true
  has_many :workers
end
