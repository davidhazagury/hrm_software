class DropTableWorkers < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :workers, :companies
    remove_foreign_key :workers, :type_of_contracts
    remove_foreign_key :workers, :departments
    remove_foreign_key :workers, :genres
    remove_foreign_key :workers, :work_centers
    remove_foreign_key :workers, :positions
    remove_foreign_key :workers, :groups
    remove_foreign_key :workers, :levels
    remove_foreign_key :workers, :areas
    remove_foreign_key :workers, :type_of_shifts
    remove_foreign_key :workers, :end_contract_reasons
    remove_foreign_key :permissions, :workers
    remove_foreign_key :sicks, :workers
    remove_foreign_key :notes, :workers
    add_reference :sicks, :user, foreign_key: true
    add_reference :permissions, :user, foreign_key: true
    add_reference :notes, :user, foreign_key: true
    drop_table :workers
  end
end
