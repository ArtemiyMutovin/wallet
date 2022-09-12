class Credit < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates :debts, presence: true
  validates :debts, numericality: { only_integer: true, greater_than: 0 }

  after_create :send_notification

  private

  def send_notification
    NewCreditsNotificationJob.perform_later(user, self)
  end
end
