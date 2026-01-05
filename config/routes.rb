Rails.application.routes.draw do
  resources :reviews, only: [:index, :show, :create, :update, :destroy]
  resources :castings, only: [:index, :show, :create, :update, :destroy]
  resources :movies, only: [:index, :show, :create, :update, :destroy]
  resources :people, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resource :session, only: [ :create, :destroy ]
end
