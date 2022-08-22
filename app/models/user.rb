# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable,
         :trackable

  has_one :account, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }
end
