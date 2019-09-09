Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'

  get 'feed', to: 'articles#feed'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale

  resources :articles  do
    resources :comments
  end

end
