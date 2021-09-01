class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :type_of_area

      t.timestamps
    end
  end
end
