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
      get 'register', to: "devise/registrations#new"
      get 'login', to: "devise/sessions#new"
  end

  # ----------------------------------------------------------
    # Static Pages
  # ----------------------------------------------------------
  get 'application/story', :path => "the_story"

end
