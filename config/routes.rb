Rails.application.routes.draw do
  devise_for :users
  
  get 'welcome/index'

  resources :users, only: [:edit, :update, :show] do
  resources :bolus_doses, only: [:new, :create] do
  end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # COMMENTED OUT THE SINATRA GEM - Incase the native ui for sidekiq does not work.
  #require 'sidekiq/web'
  #mount Sidekiq::Web => '/sidekiq
end
