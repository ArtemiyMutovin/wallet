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
end