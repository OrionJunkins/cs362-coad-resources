require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  context 'unauthenticated users' do
    describe '#index' do
      it 'redirects to the sign_in screen' do
        get :index          
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe '#show' do
      it 'rediects to the sign_in screen' do
        get :show, params: {id: 'fake'}
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe '#new' do
      it 'rediects to the sign_in screen' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
    
  describe '#create' do
      it 'redirects to the sign_in screen' do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  context 'organization users' do
    before do
      organization_user = build(:user, :organization)
      allow(request.env['warden']).to receive(:authenticate!).and_return(organization_user)
      allow(controller).to receive(:current_user).and_return(organization_user) # Override current_user()
    end

    it 'redirects to the dashboard url' do
      get :index
      expect(response).to redirect_to(dashboard_url)
    end

  end
  
 #copy all from above but redirect to dashboard_url

end
