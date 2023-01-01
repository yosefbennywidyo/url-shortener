Rails.application.routes.draw do
  get '/s/:slug', to: 'links#show', as: :short
  resources :links, only: [:index, :create]
  root 'links#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
