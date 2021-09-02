class CreateTypeOfShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :type_of_shifts do |t|
      t.string :name_of_shift

      t.timestamps
    end
  end
end
