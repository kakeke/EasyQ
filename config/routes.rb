Rails.application.routes.draw do
  root to: 'top#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'questions/update_base64'

  resources :sessions, only: %i(new create destroy)
  resources :top, only: %i(index)

  resources :users, only: [:show, :edit, :create, :destroy]
  resources :questions, only: [:show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
