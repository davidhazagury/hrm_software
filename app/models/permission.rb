class Permission < ApplicationRecord
  validates :permission_rejoin_date, presence: true
  validates :permission_start_date, presence: true
  validates :comment, presence: true, length: { minimum: 15, maximum: 30 }
  # Rejoin date must be greater than the start date
  validate :check_dates
  belongs_to :user
  belongs_to :type_of_permission


  private

  def check_dates
    if (self.permission_start_date > self.permission_rejoin_date) || (self.permission_rejoin_date < self.permission_start_date)
      errors.add(:alert, 'Fecha de reincorporación no puede ser menor a la fecha de comienzo')
    end
  end
end
