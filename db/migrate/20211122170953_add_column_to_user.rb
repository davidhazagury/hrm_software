class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_date, :date
    add_column :users, :end_date, :date
    add_column :users, :sin_num, :string
    add_column :users, :personal_email, :string
    add_column :users, :id_num, :string
    add_column :users, :phone_number, :string
    add_column :users, :bank_account, :string
    add_column :users, :annual_salary, :integer
    add_column :users, :active, :boolean, :default => true
    add_column :users, :vacation_counter, :integer, :default => 0
    add_column :users, :trial_period, :date
    add_reference :users, :type_of_contract, foreign_key: true
    add_reference :users, :department, foreign_key: true
    add_reference :users, :genre, foreign_key: true
    add_column :users, :previous_year_vacation_counter, :integer, :default => 0
    add_reference :users, :type_of_shift, foreign_key: true
    add_reference :users, :work_center, foreign_key: true
    add_reference :users, :position, foreign_key: true
    add_column :users, :created_by, :string
    add_column :users, :modified_by, :string
    add_column :users, :start_date, :date
    add_reference :users, :end_contract_reason, foreign_key: true
  end
end
