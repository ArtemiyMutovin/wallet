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

  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def set_account
    Account.create(number: random, user_id: id)
  end

  def random
    (0...3).map { rand(100) }.join
  end
end
