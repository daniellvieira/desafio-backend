require 'sidekiq/web'

Rails.application.routes.draw do
  root 'home#index'

  resources :file_histories, only: %i[create]
  resources :parlamentarians do
    resources :expenses, only: %i[index]
  end

  mount Sidekiq::Web => '/sidekiq'

  get '*path' => redirect('/')
end
