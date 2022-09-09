require 'rails_helper'

RSpec.describe Transfer, type: :model do
  it { is_expected.to belong_to(:sender).class_name('User') }
  it { is_expected.to belong_to(:receiver).class_name('User') }
  it { is_expected.to validate_presence_of :amount }
end
