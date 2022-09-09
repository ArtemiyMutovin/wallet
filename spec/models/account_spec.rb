# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :balance }
  it { is_expected.to validate_numericality_of(:balance) }

  describe 'validate number uniqueness' do
    let(:account) { create(:account) }

    it { is_expected.to validate_uniqueness_of(:number).case_insensitive }
  end

  describe 'increase balance' do
    let(:user) { create(:user) }
    let(:account) { create(:account, user: user) }

    it 'add credits in account balance' do
      account.increase_balance(1000)
      expect(account.balance).to eq 2000
    end
  end

  describe 'decrease balance' do
    let(:user) { create(:user) }
    let(:account) { create(:account, user: user) }

    it 'delete amount from account balance' do
      account.decrease_balance(100)
      expect(account.balance).to eq 900
    end
  end
end
