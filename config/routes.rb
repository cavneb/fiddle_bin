FiddleBin::Application.routes.draw do
  root 'ember#index'
  get 'auth/:provider/callback', to: 'omniauth_callbacks#create'
  get 'auth/failure', to: 'omniauth_callbacks#failure'
  get 'signout', to: 'omniauth_callbacks#destroy', as: 'signout'

  namespace :api do
    namespace :v1 do
      resources :entries
    end
  end
end
