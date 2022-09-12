require 'rails_helper'

RSpec.describe NewCreditsNotificationMailer, type: :mailer do
  let(:user) { create(:user) }
  let(:account) { create(:account, user: user) }
  let!(:credit) { create(:credit, account: account, user: user) }
  let(:mail_for_user) { described_class.send_notification(user, credit) }

  describe 'NewCreditsNotificationMailer#send_notification' do
    it 'renders the headers' do
      expect(mail_for_user.subject).to eq('New credit')
      expect(mail_for_user.to).to eq([user.email])
      expect(mail_for_user.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail_for_user.body.encoded).to match(credit.debts.to_s)
    end
  end
end
