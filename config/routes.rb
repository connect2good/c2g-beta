C2g::Application.routes.draw do
  resources :roles
  # The priority is based upon order of creation:
  # first created -> highest priority.

  devise_for :users

  root 'pages#home'

  resources :goods
  resources :merchandises
  resources :needs
  resources :organization
  resources :pages
  resources :people
  get "join", to: "pages#join"

  # get "merchandise/search"
  # get "merchandise/index"
  # get "merchandise/sell"
  # get "merchandise/buy"
  # get "merchandise/new"
  # get "merchandise/edit"
  # get "merchandise/destroy"
  # get "nonprofit/new"
  # get "needs/index"
  # get "needs/donate"
  # get "needs/search"
  # get "needs/new"
  # get "needs/edit"
  # get "needs/destroy"

  # get "donations/new"
  # get "contact_form/new"
  # get "contact_form/create"



  # resources :search_suggestions



end
