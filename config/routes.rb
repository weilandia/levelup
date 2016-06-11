require 'api_constraints'

Rails.application.routes.draw do
  root 'pages#landing'
  get '/users/auth/github', as: :github_login
  get '/users/auth/facebook', as: :facebook_login
  get '/users/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', as: :signout

  resource :users, as: :user, only: [:show]

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      jsonapi_resources :users
    end
  end
end
