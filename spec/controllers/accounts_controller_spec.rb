require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { create(:user) }
  let(:account) { create(:account, user: user) }

  describe 'GET #show' do
    before do
      sign_in(user)
      get :show
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
