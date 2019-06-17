Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'application#welcome'
  get '/stores', to: 'stores#index'
  post '/login', to: 'auth#login'
  post '/signup', to: 'users#create'
  get '/likes', to: 'users_store#index'
  
  # get '/user_stores', to: 'user_store#index'

  post '/visit', to: 'user_store#visit'
  post '/favorite', to: 'user_store#favorite'

end
