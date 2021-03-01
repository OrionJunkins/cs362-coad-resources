require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  context 'unauthenticated users' do
    it 'redirects to the sign_in screen' do
      get :index          
      expect(response).to redirect_to(new_user_session_path)

      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

      get :new
      expect(response).to redirect_to(new_user_session_path)

      post :create
      expect(response).to redirect_to(new_user_session_path)

      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

      patch :activate, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

      patch :deactivate, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

      delete :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)
    end

  end



  context 'organization users' do
    before do
      organization_user = double()
      allow(organization_user).to receive(:admin?).and_return(false)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user)
    end

    it 'redirects to the dashboard url' do
      get :index
      expect(response).to redirect_to(dashboard_url)

      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      get :new
      expect(response).to redirect_to(dashboard_url)

      post :create
      expect(response).to redirect_to(dashboard_url)

      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      patch :activate, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      patch :deactivate, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      delete :destroy, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

    end

  end
end
