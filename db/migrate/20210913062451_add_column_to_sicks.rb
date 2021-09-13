class AddColumnToSicks < ActiveRecord::Migration[6.0]
  def change
    add_reference :sicks, :worker, foreign_key: true
    add_column :sicks, :doctor_note_sickeness, :boolean, :default => false
    add_column :sicks, :rejoin_note_sickeness, :boolean, :default => false
    add_column :sicks, :comment, :string
    add_column :sicks, :start_date_sickness, :date
    add_column :sicks, :rejoin_date_sickness, :date
  end
end
