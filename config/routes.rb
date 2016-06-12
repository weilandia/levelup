Rails.application.routes.draw do
  root 'pages#landing'
  get '/auth/github', as: :github_login
  get '/auth/facebook', as: :facebook_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', as: :signout

  resource :users, as: :user, only: [:show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      jsonapi_resources :users, only: [:show]
    end
  end
end
