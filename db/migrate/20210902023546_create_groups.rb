class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :type_of_group

      t.timestamps
    end
  end
end
