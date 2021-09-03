class CreateEmailNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :email_notifications do |t|
      t.string :notification
      t.string :description

      t.timestamps
    end
  end
end
