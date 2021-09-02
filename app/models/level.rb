class Level < ApplicationRecord
  validates :type_of_level, presence: true, uniqueness: true
end
