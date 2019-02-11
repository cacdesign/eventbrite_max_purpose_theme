class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event





  after_create :admin_notification_send

  def admin_notification_send
    AttendanceMailer.admin_notification_email(self).deliver_now
  end



end
