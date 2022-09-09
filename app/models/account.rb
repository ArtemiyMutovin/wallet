class Account < ApplicationRecord
  belongs_to :user
  has_many :credits, dependent: :destroy

  validates :number, uniqueness: { case_sensitive: false }
  validates :balance, presence: true
  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def increase_balance(amount)
    self.balance += amount
    save
  end

  def decrease_balance(amount)
    self.balance -= amount
    save
  end
end
