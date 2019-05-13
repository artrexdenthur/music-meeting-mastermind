Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :users
  resources :choruses
  resources :chorus
  resources :singers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
