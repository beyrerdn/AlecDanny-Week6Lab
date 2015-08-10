Rails.application.routes.draw do
  root 'posts#welcome_page'

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



end
