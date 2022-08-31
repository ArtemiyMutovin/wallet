class Account < ApplicationRecord
  belongs_to :user

  validates :number, uniqueness: { case_sensitive: false }
  validates :balance, presence: true
  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end