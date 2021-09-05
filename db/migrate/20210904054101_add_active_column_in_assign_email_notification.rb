class AddActiveColumnInAssignEmailNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :email_notifications, :active, :boolean, :default => false
  end
end
