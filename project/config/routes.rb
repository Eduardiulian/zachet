Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'users/new'
    get 'session/new'
    get 'session/login'
    post 'session/create'
    root 'main#index'
    get 'main/index'
    get 'main/profile'
    post 'main/edit'
    get 'main/profile_edit'
    get '/signin', to: 'session#new'
    get '/signup', to: 'users#new'
    get '/logout', to: 'session#logout'
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
