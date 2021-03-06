Rails.application.routes.draw do
  root 'ideas#index'
  get 'sessions/new'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :labels
  resources :ideas
end
