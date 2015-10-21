Rails.application.routes.draw do
  root 'ideas#index'
  resources :labels
  resources :ideas
end
