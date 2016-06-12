require 'api_constraints'

Rails.application.routes.draw do
  root 'pages#landing'
  get '/auth/github', as: :github_login
  get '/auth/facebook', as: :facebook_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', as: :signout

  resource :users, as: :user, only: [:show]

  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      jsonapi_resources :users
    end
  end
end
