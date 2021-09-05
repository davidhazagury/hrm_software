class RemoveColumnActiveOfEmailNotificationAndAddColumnActiveToAssignEmailNotification < ActiveRecord::Migration[6.0]
  def change
    remove_column :email_notifications, :active
    add_column :assign_email_notifications, :active, :boolean, :default => false
  end
end
