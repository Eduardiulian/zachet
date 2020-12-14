Rails.application.routes.draw do
  get 'users/new'
  get 'session/new'
  root 'main#index'
  get 'main/index'
  get 'main/profile'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
