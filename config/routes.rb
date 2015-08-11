Rails.application.routes.draw do

  get 'profiles/:id/follow' => 'profiles#follow', as: :follow
  get 'profiles/:id/unfollow' => 'profiles#unfollow', as: :unfollow

  get 'profiles/users/:username' => 'profiles#user_page', as: :user_page

  resources :profiles
  resources :posts

  devise_for :users, controllers: {
    confirmations:  "users/confirmations",
    # omniauth_callbacks: 'users/omniauth_callbacks'
    passwords:      "users/passwords",
    registrations:  "users/registrations",
    sessions:       "users/sessions",
    unlocks:        "users/unlocks"
  }

  #Wicked Wizard
  resources :after_signup

  #http://stackoverflow.com/questions/18997874/devise-with-rails-4-authenticated-root-route-not-working
  authenticated :user do
    devise_scope :user do
      root to: "profiles#current_user_page", :as => "authenticated_root"
    end
  end

  #http://stackoverflow.com/questions/18997874/devise-with-rails-4-authenticated-root-route-not-working
  unauthenticated do
    devise_scope :user do
      root to: "posts#index", :as => "unauthenticated_root"
    end
  end

end
