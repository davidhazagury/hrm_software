class Period < ApplicationRecord
  validates :year, presence: true, uniqueness: true
  after_create :reset_vacations

  private

  def reset_vacations

    # WE NEED TO RESET VACATIONS, SAVE PENDING TAKEN VACATIONS FROM PREVIOUS YEAR AND PUT COUNTERS TO CERO

    raise
  end
end
