C2g::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users, except: [:index, :edit, :destroy]
  
  get   "merchandise/search"
  get   "merchandise/index"
  get   "merchandise/sell"
  get   "merchandise/buy"
  get   "merchandise/new"
  get   "merchandise/edit"
  get   "merchandise/destroy"
  get   "nonprofit/new"
  get   "needs/index"
  get   "needs/donate"
  get   "needs/search"
  get   "needs/new"
  get "needs/edit"
  get   "needs/destroy"

  get "donations/new"
  get "contact_form/new"
  get "contact_form/create"
  resources :search_suggestions

  # devise_scope :user do
  #   get "/users/password/forgot", to: "devise/passwords#new", as: "new_user_password"
  # end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  #admin dashboard
  get 'admin', to: 'admins#show'

  #static pages
  get 'about', to: 'pages#about'
  get 'faq', to: 'pages#faq'
  get 'lets_connect_to_good', to: 'pages#lets_connect_to_good'
  get 'join', to: 'pages#join'
  get 'offers/:offer_id/success', to: 'offers#success', as: 'success'

  get 'needs/:need_id/offers', to: 'offers#new', as: 'new_offer'
  post 'needs/:need_id/offers', to: 'offers#create', as: 'create_offer'

  get 'contact_forms/new', to: 'contact_form#new', as: 'contact'
  post 'contact_forms', to: 'contact_form#create'

  resources :needs
  resources :offers, except: [:create]
  resources :organizations do
    resources :offers, except: [:show, :create]
    resources :needs, except: [:show]
  end

end
