Rails.application.routes.draw do
  root 'kittens#index'
  get 'index', to: 'kittens#index'
  resources :kittens
end
