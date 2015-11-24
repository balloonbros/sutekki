Rails.application.routes.draw do
  resources :users
  root 'ideas#index'
  resources :labels
  resources :ideas
end
