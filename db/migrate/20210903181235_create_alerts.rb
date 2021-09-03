class CreateAlerts < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.string :name_of_alert

      t.timestamps
    end
  end
end
