class AddColumnsFreeTrialToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :trial_started_at, :datetime
    add_column :companies, :trial_ended_at, :datetime
    add_column :companies, :company_account_activated, :boolean, default: true
    add_column :companies, :free_trial_period_activated, :boolean, default: true
    add_column :companies, :free_trial_period_days, :integer
  end
end
