class DropTableAlerts < ActiveRecord::Migration[6.0]
  def change
    drop_table :alerts
  end
end
