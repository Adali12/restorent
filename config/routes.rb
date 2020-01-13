Rails.application.routes.draw do
  get 'comments/create'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :restos
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
