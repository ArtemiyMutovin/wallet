require 'rails_helper'

RSpec.describe NewCreditsNotificationJob, type: :job do
  let(:service) { double('NewCreditsNotification') }
  let(:user) { create(:user) }
  let(:account) { create(:account, user: user) }
  let(:credit) { create(:credit, account: account, user: user) }

  it 'calls NewAnswersNotification#send_notification(answer)' do
    allow(NewCreditsNotification).to receive(:new).and_return(service)
    expect(service).to receive(:send_notification).with(user, credit)
    described_class.perform_now(user, credit)
  end
end
