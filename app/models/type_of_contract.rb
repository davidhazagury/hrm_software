class TypeOfContract < ApplicationRecord
  validates :name_type_of_contract, presence: true, uniqueness: true
  has_many :workers
end
