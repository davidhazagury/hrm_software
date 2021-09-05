class CreateAssignEmailNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :assign_email_notifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :email_notification, null: false, foreign_key: true

      t.timestamps
    end
  end
end
