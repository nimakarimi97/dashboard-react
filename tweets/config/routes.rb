Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  get 'about', to: 'home#about', as: :about

  get '/auth/twitter/callback', to: 'omniauth_callbacks#twitter'
  resources :twitter_accounts
  resources :tweets

  # post 'auth/twitter', as: 'connect_twitter_account'
end
