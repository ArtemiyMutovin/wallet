# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  after_create :set_account

  has_one :account, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :sender_transfers, class_name: 'Transfer', foreign_key: :sender_id, dependent: :destroy, inverse_of: :sender
  has_many :receiver_transfers, class_name: 'Transfer', foreign_key: :receiver_id, dependent: :destroy, inverse_of: :receiver

  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def set_account
    Account.create(number: random.to_s, user_id: id)
  end

  def random
    (0...3).map { rand(100) }.join
  end
end
