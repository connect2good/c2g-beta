C2g::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  get "inquiries/new"
  get "inquiries/create"
  get "purchases/index"
  get "purchases/new"
  get "purchases/create"

  devise_for :organizations
  devise_for :individuals

  # root 'pages#home'
  root 'pages#boxes'

  resources :merchandises do
    resources :purchases
    resources :inquiries
  end

  resources :needs do
    resources :donations
  end

  resources :individuals

  get '/individuals/:id/sale_items',
    to: 'individuals#show',
    as: :individuals_sale_items

  get '/individuals/:id/donations',
    to: 'individuals#show',
    as: :individuals_purchases

  get '/individuals/:id/purchases',
    to: 'individuals#show',
    as: :individuals_donations

  resources :donations
  resources :needs
  
  resources :organizations

  get '/organizations/:id/needs',
    to: 'organizations#show',
    as: :organizations_needs

  get '/organizations/:id/benefits',
    to: 'organizations#show',
    as: :organizations_benefits

  resources :pages

  get "join", to: "pages#join"
  get "about", to: "pages#about"

  namespace :admin do
    resources :individuals
  end

end
