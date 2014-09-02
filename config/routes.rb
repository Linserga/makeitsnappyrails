Rails.application.routes.draw do
  
  match 'register', to: 'users#new', via: :get
  match 'login', to: 'sessions#new', via: :get
  match 'logout', to: 'sessions#destroy', via: :delete
  match 'your_questions', to: 'questions#your_questions', via: :get
  match 'search', to: 'questions#search', via: :get

  root to: 'questions#index'

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  resources :questions, except: [:new] do
  	resources :answers, only: [:create]
  end
end
