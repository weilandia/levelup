require 'api_constraints'

Rails.application.routes.draw do
  root 'pages#landing'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      jsonapi_resources :users
    end
  end
end
