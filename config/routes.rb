Rails.application.routes.draw do
  devise_for :users
  
  root to: "work_histories#index"

  resources :work_histories, except: [ :show, :destroy ]  

  namespace :work_histories do
    get :now
    post :check_now
  end
end
