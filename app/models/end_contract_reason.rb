class EndContractReason < ApplicationRecord
  validates :name_of_end_reason, presence: true, uniqueness: true
  has_many :users
end
