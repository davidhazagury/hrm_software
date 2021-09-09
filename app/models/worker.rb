class Worker < ApplicationRecord
  belongs_to :area
  belongs_to :company
  belongs_to :department
  belongs_to :genre
  belongs_to :group
  belongs_to :level
  belongs_to :position
  belongs_to :type_of_contract
  belongs_to :type_of_shift
end
