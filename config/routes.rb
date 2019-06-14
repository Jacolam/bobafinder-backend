Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/', to: 'application#welcome'
  post '/login', to: 'auth#login'
  post '/signup', to: "users#create"
end
