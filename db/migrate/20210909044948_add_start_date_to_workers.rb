class AddStartDateToWorkers < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :start_date, :date
  end
end
