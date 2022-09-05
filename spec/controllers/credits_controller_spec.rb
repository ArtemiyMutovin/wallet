require 'rails_helper'

RSpec.describe CreditsController, type: :controller do
  let(:user) { create(:user) }
  let(:account) { create(:account, user: user) }
  let(:credit) { create(:credit) }

  describe 'GET #new' do
    before do
      sign_in(user)
      get :new
    end

    it 'assigns the requested question to @question' do
      expect(assigns(:credit)).to be_a_new(Credit)
    end

    it 'renders show view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    before do
      sign_in(user)
    end

    context 'with valid attributes' do
      it 'saves a new credit in database' do
        expect { post :create, params: { credit: attributes_for(:credit) } }
          .to change(Credit, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { credit: attributes_for(:credit) }
        expect(response).to redirect_to root_path(assigns(:account))
      end
    end

    context 'with invalid attributes' do
      it 'does not saves a new credit in database' do
        expect { post :create, params: { credit: attributes_for(:credit, :invalid) } }
          .not_to change(Credit, :count)
      end

      it 're-renders new view' do
        post :create, params: { credit: attributes_for(:credit, :invalid) }
        expect(response).to render_template :new
      end
    end
  end
end
