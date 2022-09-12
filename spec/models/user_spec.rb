# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_subject) { described_class.new }

  it { is_expected.to have_one(:account).dependent(:destroy) }

  it {
    expect(user_subject).to have_many(:sender_transfers)
      .class_name('Transfer').with_foreign_key(:sender_id).dependent(:destroy)
  }

  it {
    expect(user_subject).to have_many(:receiver_transfers)
      .class_name('Transfer').with_foreign_key(:receiver_id).dependent(:destroy)
  }

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  describe 'validate user uniqueness' do
    let(:user) { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'transfer' do
    let(:user) { create(:user) }
    let(:receiver) { create(:user) }
    let(:transfer) { create(:transfer, sender: user, receiver: receiver) }
    let(:other_transfer) { create(:transfer, sender: receiver, receiver: user) }

    it 'finding user transfers' do
      expect(user.transfers).to eq([transfer, other_transfer])
    end
  end
end
