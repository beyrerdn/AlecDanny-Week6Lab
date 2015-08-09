Rails.application.routes.draw do
  resources :profiles
  resources :posts

  devise_for :users, controllers: {
    confirmations:  'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks'
    passwords:      'users/passwords',
    registrations:  'users/registrations',
    sessions:       'users/sessions',
    unlocks:        'users/unlocks'
  }

  #Wicked Wizard
  resources :after_signup

  root 'posts#welcome_page'

end
