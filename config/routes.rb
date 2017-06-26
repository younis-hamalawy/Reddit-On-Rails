Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :posts, except: [:index]
  resources :subs

  root to: "subs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
