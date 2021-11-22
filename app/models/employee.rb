class Employee < User
  # ***** VALIDATIONS ****
  # FIRST NAME AND LAST NAME ARE ALREADY VALIDATED IN THE USER CLASS
  #validates :first_name, presence: true
  #validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :start_date, presence: true
  # SIN Number has to be only numbers and unique.
  validates :sin_num, presence: true, uniqueness: true, format: { with: /[0-9]{1,45}/, message: " Número SS introducido en formato inválido" },
                                                        length: { minimum: 8, message:  "Mínimo de caractéres debe ser 8" }
  validates :personal_email, presence: true, uniqueness: true
  validates :id_num, presence: true, uniqueness: true, format: {with:/([A-Z]|[0-9])[0-9]{7}([A-Z])/, message:'Introducir DNI ó NIE válido'}
  validates :phone_number, presence: true, uniqueness: true, format: {with:/(6|7)([0-9]){8}/, message:'Introducir número válido'}
  validates :bank_account, presence: true, uniqueness: true, format: {with:/([A-Z]{2})([0-9]{22})/, message:'Introducir IBAN válido'}
  validates :annual_salary, presence: true, numericality: { only_integer: true }
  validates :avatar, content_type: 'image/png',content_type: [:png, :jpg, :jpeg], limit: {min: 1, max: 1 }
  validates :files, content_type: [ :pdf, :doc, :docx, :xls, :xlsx], limit: {min:0, max: 7 }
  # **** RELATIONS ****
  has_many :permissions
  has_many :sicks
  has_many :notes
  has_one_attached :avatar
  has_many_attached :files
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
  belongs_to :end_contract_reason, optional: true

  before_create :set_vacations

  def set_avatar
    # List avatars available in the assets folder (returns an array with the paths)
    avatars = Dir.glob('app/assets/images/avatars/*')
    # We want to pick a random avatar, depending on genre.
    male = []
    female = []
    # Split the string and grab the last element => last element == file name
    avatars.each do |avatar|
      file_name = avatar.split('/').last.to_s
      # We have standarized the name of the avatars.
      if file_name.include? 'woman'
        female.push(file_name)
      else
        male.push(file_name)
      end
    end

   # We pick a random avatar, depending on the workers genre

    return self.genre_id == 1 ? female.sample() : male.sample()
  end

  private

  def set_vacations
  end
end
