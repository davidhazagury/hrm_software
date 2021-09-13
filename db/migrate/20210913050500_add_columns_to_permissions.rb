class AddColumnsToPermissions < ActiveRecord::Migration[6.0]
  def change
    add_reference :permissions, :worker, foreign_key: true
    add_column :permissions, :note, :boolean, :default => false
    add_column :permissions, :comment, :string
    add_column :permissions, :permission_start_date, :date
    add_column :permissions, :permission_rejoin_date, :date
    add_reference :permissions, :type_of_permission, foreign_key: true
  end
end
