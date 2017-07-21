Rails.application.routes.draw do
  root 'pages#welcome'

  get '/users', to: 'users#index'

  resources :pitches, only: [:new, :index, :create]

  get '/admin', to: "admin#index"

  patch '/cohort', to: "cohort#update", as: :cohort

  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  get '/votes', to: 'votes#index'
  post '/votes', to: 'votes#create'
  patch '/votes', to: 'votes#update'
end
