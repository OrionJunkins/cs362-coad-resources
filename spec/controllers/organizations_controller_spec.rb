require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  
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

      post :approve, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

      post :reject, params: {id: 'fake'}
      expect(response).to redirect_to(new_user_session_path)

    end

  end


  context 'Organization users with an approved organization: ' do

    before do
      organization_user = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user) # Override current_user()
      organization_user.organization = build(:organization)
    end

    it 'redirects to the dashboard url' do 
      get :new
      expect(response).to redirect_to(dashboard_url)

      post :create
      expect(response).to redirect_to(dashboard_url)

      post :reject, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      post :approve, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
    end

  end


  context 'General organization users with an unapproved organization: ' do

    before do
      organization_user = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user) # Override current_user()
      organization_user.organization = build(:organization, :unapproved)
    end

    it 'redirects to the dashboard url' do 
      patch :update, params: {id: "fake" } 
      expect(response).to redirect_to(dashboard_url)

      get :new
      expect(response).to redirect_to(dashboard_url)

      post :create
      expect(response).to redirect_to(dashboard_url)

      post :reject, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      post :approve, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      get :show, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

    end

  end


  context 'admin user' do

    before do
      admin_user = build(:user, :admin)
      allow(request.env['warden']).to receive(:authenticate!).and_return(admin_user)
      allow(controller).to receive(:current_user).and_return(admin_user) # Override current_user()
    end

    it 'redirects to the dashboard url' do 
      get :new, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      post :create
      expect(response).to redirect_to(dashboard_url)

      get :edit, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)

      patch :update, params: {id: 'fake'}
      expect(response).to redirect_to(dashboard_url)
    end

  end

end
