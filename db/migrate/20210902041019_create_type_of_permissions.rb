class CreateTypeOfPermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :type_of_permissions do |t|
      t.string :name_of_permission

      t.timestamps
    end
  end
end
