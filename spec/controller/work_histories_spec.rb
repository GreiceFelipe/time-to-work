# frozen_string_literal: true

require('rails_helper')

RSpec.describe(WorkHistoriesController, type: :controller) do
  describe 'as an authenticated user' do
    let(:user) { create(:user) }
    let(:work_history) { create(:work_history, user: user) }

    describe 'GET /work_histories' do
      context 'with successful response' do
        it 'return a ok status' do
          sign_in user
          get :index
          expect(response).to have_http_status(:ok) 
        end
      end
    end

    describe 'GET /work_histories/new' do
      context 'with successful response' do
        it 'return a ok status' do
          sign_in user
          get :new
          expect(response).to have_http_status(:ok) 
        end
      end
    end

    describe 'POST /work_histories' do
      context 'with successful response' do
        it 'return a created status' do
          sign_in user
          post :create, params: { work_history: { starts_at: "2020-10-21 21:21:35 -0300" } }
          expect(response).to have_http_status(:found) 
        end
      end
    end

    describe 'GET /work_histories/:id/edit' do
      context 'with successful response' do
        it 'return a ok status' do
          sign_in user
          get :edit, params: { id: work_history.id }
          expect(response).to have_http_status(:ok) 
        end
      end
    end

    describe 'PUT /work_histories/:id' do
      context 'with successful response' do
        it 'return a created status' do
          sign_in user
          put :update, params: { id: work_history.id, work_history: { starts_at: "2020-10-21 21:21:35 -0300" } }
          expect(response).to have_http_status(:found) 
        end
      end
    end

    describe 'GET /work_histories/now' do
      context 'with successful response' do
        it 'return a ok status' do
          sign_in user
          get :now
          expect(response).to have_http_status(:ok) 
        end
      end
    end

    describe 'PUT /work_histories/check_now' do
      context 'with successful response' do
        it 'return a found status' do
          sign_in user
          put :check_now, params: { work_history: { starts_at: "2020-10-21 21:21:35 -0300" } }
          expect(response).to have_http_status(:found) 
        end
      end
    end
    
  end
end


