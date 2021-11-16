class Company < ApplicationRecord
  validates :name_of_company, presence: true, uniqueness: true
  validates :first_name_company_contact, presence: true
  validates :last_name_company_contact, presence: true
  validates :email_company_contact, presence: true, uniqueness: true
  validates :number_of_employees_company, presence: true, numericality: {only_integer: true}
  validates :phone_company_contact, presence: false, numericality: {only_integer: true}
  has_many :workers
end
