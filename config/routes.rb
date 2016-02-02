Rails.application.routes.draw do

  # ----------------------------------------------------------
    # Posts
  # ----------------------------------------------------------

  resources :posts

  root to: 'posts#index' 
  
  # ----------------------------------------------------------
    # Tags
  # ----------------------------------------------------------

  resources :tags, except: [:show]

  # ----------------------------------------------------------
    # Devise
  # ----------------------------------------------------------

  devise_for :users
  devise_scope :user do 
      get 'manflesh', to: "devise/registrations#new"
      get 'macgruberkfbr392', to: "devise/sessions#new"
  end

  # ----------------------------------------------------------
    # Static Pages
  # ----------------------------------------------------------
  get 'application/story', :path => "the-story"
  get 'application/about', :path => "what-is-this"
  get 'application/contact', :path => "contact-us"



end
