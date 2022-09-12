class NewCreditsNotificationJob < ApplicationJob
  queue_as :default

  def perform(user, credit)
    NewCreditsNotification.new.send_notification(user, credit)
  end
end
