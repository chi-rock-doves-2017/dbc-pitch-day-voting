Rails.application.routes.draw do
  root 'pages#welcome'

  get '/pitches', to: 'pitches#index'

  get '/users', to: 'users#index'
  get "/auth/github/callback", to: "users#create", as: :create


  resources :pitches, only: [:new, :index, :create]
end
