require 'rails_helper'

RSpec.describe Transfer::CreateService do
  let(:user) { create(:user) }
  let(:receiver) { create(:user) }
  let(:account) { create(:account, user: user) }
  let(:receiver_account) { create(:account, user: receiver) }

  context 'with valid attributes' do
    it 'create transfer' do
      service_response = described_class.new(amount: 100, account_number: receiver_account.number, sender_account: account).call
      expect(service_response.transfer).not_to eq(nil)
      expect(service_response.errors).to eq([])
    end
  end

  context 'with invalid attributes' do
    it "don't create transfer if amount =< sender account balance" do
      service_response = described_class.new(amount: 5000, account_number: '123', sender_account: account).call
      expect(service_response.transfer).to eq(nil)
      expect(service_response.errors).to eq(['invalid transfer parameters'])
    end

    it "don't create transfer if receiver account present?" do
      service_response = described_class.new(amount: 5000, account_number: nil, sender_account: account).call
      expect(service_response.transfer).to eq(nil)
      expect(service_response.errors).to eq(['invalid transfer parameters'])
    end

    it "don't create transfer if sender account != receiver account " do
      service_response = described_class.new(amount: 5000, account_number: account, sender_account: account).call
      expect(service_response.transfer).to eq(nil)
      expect(service_response.errors).to eq(['invalid transfer parameters'])
    end
  end
end
