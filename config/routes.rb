require 'sidekiq/web'

Rails.application.routes.draw do
  resources :expenses
  root 'home#index'

  resources :file_histories, only: %i[create]
  resources :parlamentarians

  mount Sidekiq::Web => '/sidekiq'

  get '*path' => redirect('/')
end
