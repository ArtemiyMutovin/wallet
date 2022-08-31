require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { create(:user) }
  let(:account) { create(:account, user: user) }

  describe 'GET #index' do
    before do
      sign_in(user)
      get :index
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end
end
