Rails.application.routes.draw do
  root 'home#index'

  get 'sessions/new' => 'sessions#new', as: :login
  post 'sessions/new' => 'sessions#create'
  delete 'sessions' => 'sessions#delete', as: :logout

  resources :books

  get 'register' => 'users#new', as: :registration
  post 'register' => 'users#create'

  get 'users/:username' => 'users#show', as: :user



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
