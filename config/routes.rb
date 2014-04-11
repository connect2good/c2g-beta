C2g::Application.routes.draw do
  get "marketplaces/index"
  get "marketplaces/create"
  get "marketplaces/new"
  get "marketplaces/edit"
  get "marketplaces/destroy"
  get "donation/index"
  get "donation/create"
  get "donation/new"
  get "donation/edit"
  get "donation/destroy"
  get "marketplace/index"
  get "marketplace/create"
  get "marketplace/new"
  get "marketplace/edit"
  get "marketplace/destroy"
  resources :roles
  # The priority is based upon order of creation:
  # first created -> highest priority.

  devise_for :users

  root 'pages#home'

  resources :goods
  resources :merchandises do
    resources :marketplaces
  end
  resources :needs
  resources :organization
  resources :pages
  resources :people
  resources :transactions
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
