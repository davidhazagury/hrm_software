class Sick < ApplicationRecord
  validates :start_date_sickness, presence: true
  validates :rejoin_date_sickness, presence: true
  validates :comment, presence: true, length: { minimum: 15, maximum: 30 }
  # Rejoin date must be greater than the start date
  validate :check_dates
  belongs_to :worker

  private

  def check_dates
    if (self.start_date_sickness > self.rejoin_date_sickness) || (self.rejoin_date_sickness < self.start_date_sickness)
      errors.add(:alert, 'Fecha de reincorporación no puede ser menor a la fecha de comienzo')
    end
  end
end
