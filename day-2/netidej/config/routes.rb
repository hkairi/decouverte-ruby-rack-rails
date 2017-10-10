Rails.application.routes.draw do
  resources :utilisateurs
  resources :plats

  # connexion et déconnexion
  get '/deconnexion',to: 'accueil#logout', as: 'logout'
  get '/connexion',  to: 'accueil#login', as: 'login'
  post '/connexion', to: 'accueil#login'

  # commande
  post '/commander', to: 'accueil#commander', as: 'commande'
  root to: 'accueil#index'
end
