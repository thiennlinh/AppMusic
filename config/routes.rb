Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get 'static_pages/home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'

  get 'sessions/new'
  get 'users/new'

  get 'welcome/index'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:new, :create, :destroy, :show]

  get '/new', to: 'microposts#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
