# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users',
                     path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' },
                     controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  post '/graphql', to: 'graphql#execute'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, only: [:index]
end
