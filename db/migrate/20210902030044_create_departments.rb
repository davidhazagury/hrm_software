class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name_of_department

      t.timestamps
    end
  end
end
