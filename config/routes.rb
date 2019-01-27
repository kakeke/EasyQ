Rails.application.routes.draw do
  root to: 'top#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  post 'questions/update_base64'

  resources :sessions, only: [:create, :destroy]
  resources :top, only: [:index]
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :questions, only: [:show, :create, :destroy], param: :token
  resources :answers, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
