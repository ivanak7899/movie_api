Rails.application.routes.draw do
  resources :reviews
  resources :castings
  resources :movies
  resources :people
  resources :users

  resource :session, only: [ :create, :destroy ]
end
