class AssignEmailNotification < ApplicationRecord
  ActiveModel::Dirty
  belongs_to :user
  belongs_to :email_notification

  # This method changes the active status to activated of deactivated
  def update_active_status
    if active == true
      update_attribute(:active, false)
    else active == false
      update_attribute(:active, true)
    end
  end

   # This method displays in a human readable way the current status of an instance.
  def display_status
    if active == true
      'Activado'
    else
      'Desactivado'
    end
  end
end
