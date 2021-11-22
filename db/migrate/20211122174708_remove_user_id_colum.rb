class RemoveUserIdColum < ActiveRecord::Migration[6.0]
  def change
    remove_column :sicks, :worker_id
    remove_column :notes, :worker_id
     remove_column :permissions, :worker_id
  end
end
