class AddColumnToWorkers < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :first_name, :string
    add_column :workers, :last_name, :string
    add_column :workers, :birth_date, :date
    add_column :workers, :end_date, :date
    add_column :workers, :sin_num, :string
    add_column :workers, :personal_email, :string
    add_column :workers, :ga_email, :string
    add_column :workers, :id_num, :string
    add_column :workers, :phone_number, :string
    add_column :workers, :bank_account, :string
    add_column :workers, :job, :string
    add_column :workers, :annual_salary, :integer
    add_column :workers, :active, :boolean, :default => true
    add_column :workers, :vacation_counter, :integer, :default => 0
    add_column :workers, :trial_period, :date
    add_reference :workers, :type_of_contract, foreign_key: true
    add_reference :workers, :department, foreign_key: true
    add_reference :workers, :genre, foreign_key: true
    add_column :workers, :previous_year_vacation_counter, :integer, :default => 0
    add_reference :workers, :type_of_shift, foreign_key: true
    add_reference :workers, :work_center, foreign_key: true, :default => 1
    add_reference :workers, :company, foreign_key: true, :default => 1
    add_reference :workers, :position, foreign_key: true
    add_column :workers, :created_by, :string
    add_column :workers, :modified_by, :string
    add_reference :workers, :group, foreign_key: true
    add_reference :workers, :level, foreign_key: true
    add_reference :workers, :area, foreign_key: true
    add_column :workers, :worker_number, :integer
    add_column :workers, :notice_period, :integer
    add_column :workers, :type_of_street, :string
    add_column :workers, :street_name, :string
    add_column :workers, :street_number, :string
    add_column :workers, :building_door, :string
    add_column :workers, :building_stair, :string
    add_column :workers, :building_floor, :string
    add_column :workers, :floor_door, :string
    add_column :workers, :province, :string
    add_column :workers, :state, :string
    add_column :workers, :postal_code, :string
  end
end
