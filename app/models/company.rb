class Company < ApplicationRecord
  after_save :set_free_trial
  validates :name_of_company, presence: true, uniqueness: true
  validates :first_name_company_contact, presence: true
  validates :last_name_company_contact, presence: true
  validates :email_company_contact, presence: true, uniqueness: true
  validates :number_of_employees_company, presence: true, numericality: {only_integer: true}
  validates :phone_company_contact, presence: false, numericality: {only_integer: true, allow_blank: true}
  has_many :workers
  has_many :users

  private

  def set_free_trial
    self.trial_started_at = DateTime.now
    self.free_trial_period_days = 15
    # In the future, we will be able to update the free trial period days, and have
    # a dynamic variable.
    self.trial_ended_at = self.free_trial_period_days + self.free_trial_period_days.day
  end
end
