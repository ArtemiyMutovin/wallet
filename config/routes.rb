require 'sidekiq/web'

Rails.application.routes.draw do
  Rails.application.routes.default_url_options[:host] = 'XXX'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, path: :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  root to: 'accounts#show'

  resources :accounts, only: :show

  resources :credits

  resources :transfers
end
