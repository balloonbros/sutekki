Rails.application.routes.draw do
  root 'ideas#index'
  get 'signup'  => 'users#new'
  resources :users
  resources :labels
  resources :ideas
end
