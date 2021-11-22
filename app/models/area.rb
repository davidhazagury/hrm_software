class Area < ApplicationRecord
  validates :type_of_area, presence: true, uniqueness: true
  #has_many :users
end
