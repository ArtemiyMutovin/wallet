# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Credit, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :account }
  it { is_expected.to validate_presence_of :debts }
  it { is_expected.to validate_numericality_of(:debts) }
end
