Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'}
  root 'pages#home'
  resources :choruses do
    member do
      get 'baritones'
      get 'basses'
      get 'leads'
      get 'tenors'
    end
    resources :singers, controller: 'members', as: 'members'
  end
  resources :chorus
  resources :singers
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
