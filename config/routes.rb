Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # I added the Sinatra Gem for the Sidekiq UI. Figured do it now rather than later to view job performance
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq
end
