C2g::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :goods
  resources :merchandise
  resources :needs
  resources :organization
  resources :pages
  resources :people

  root 'pages#home'
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
