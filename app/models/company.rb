class Company < ApplicationRecord
  validates :name_of_company, presence: true, uniqueness: true
  has_many :workers
end
