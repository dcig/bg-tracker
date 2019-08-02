Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  
  get 'users/dexcom_token', to: 'users#dexcom_token'
  get 'welcome/index'

  resources :users, only: [:edit, :update, :show] do
    resources :bolus_doses, only: [:new, :create]
    resources :basal_doses, only: [:new, :create]
  end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # COMMENTED OUT THE SINATRA GEM - Incase the native ui for sidekiq does not work.
  #require 'sidekiq/web'
  #mount Sidekiq::Web => '/sidekiq
end
