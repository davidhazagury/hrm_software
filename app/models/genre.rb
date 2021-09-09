class Genre < ApplicationRecord
  validates :type_of_genre, presence: true, uniqueness: true
  has_many :workers
end
