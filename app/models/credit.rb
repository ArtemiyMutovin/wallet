class Credit < ApplicationRecord
  belongs_to :user
  belongs_to :account

  validates :debts, presence: true
end
