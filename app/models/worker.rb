class Worker < ApplicationRecord
  # ***** VALIDATIONS ****
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :start_date, presence: true
  # SIN Number has to be only numbers and unique.
  validates :sin_num, presence: true, uniqueness: true, format: { with: /[0-9]{1,45}/, message: " Número SS introducido en formato inválido" },
                                                        length: { minimum: 8, message:  "Mínimo de caractéres debe ser 8" }
  validates :personal_email, presence: true, uniqueness: true
  validates :ga_email, presence: true, uniqueness: true, format: {with:/[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(globalalumni)\.org/, message:'Introducir email válido'}
  validates :id_num, presence: true, uniqueness: true, format: {with:/([A-Z]|[0-9])[0-9]{7}([A-Z])/, message:'Introducir DNI ó NIE válido'}
  validates :phone_number, presence: true, uniqueness: true, format: {with:/(6|7)([0-9]){8}/, message:'Introducir número válido'}
  validates :bank_account, presence: true, uniqueness: true, format: {with:/([A-Z]{2})([0-9]{22})/, message:'Introducir IBAN válido'}
  validates :annual_salary, presence: true, format: {with:/[0-9]*/i, message:'Introducir formato válido'}

  # **** RELATIONS ****
  belongs_to :area
  belongs_to :company
  belongs_to :department
  belongs_to :genre
  belongs_to :group
  belongs_to :level
  belongs_to :position
  belongs_to :type_of_contract
  belongs_to :type_of_shift
  belongs_to :work_center

  def set_company_and_work_center
    self.company_id = 1
    self.work_center_id =1
  end
end
