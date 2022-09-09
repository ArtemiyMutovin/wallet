# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:account).dependent(:destroy) }
  it { is_expected.to have_many(:sender_transfers).class_name('Transfer').with_foreign_key(:sender_id).dependent(:destroy) }
  it { is_expected.to have_many(:receiver_transfers).class_name('Transfer').with_foreign_key(:receiver_id).dependent(:destroy) }
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }

  describe 'validate user uniqueness' do
    let(:user) { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end
end
