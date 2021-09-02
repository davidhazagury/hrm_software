class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.string :type_of_level

      t.timestamps
    end
  end
end
