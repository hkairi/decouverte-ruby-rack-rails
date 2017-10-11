Rails.application.routes.draw do
  resources :utilisateurs
  resources :plats

  # connexion et déconnexion
  get '/deconnexion',to: 'accueil#logout', as: 'logout'
  get '/connexion',  to: 'accueil#login', as: 'login'
  post '/connexion', to: 'accueil#login'

  # commande
  post '/commander', to: 'accueil#commander', as: 'commande'
  get  '/commande/:user_id/annuler', to: 'accueil#annuler_commande', as: 'annuler_commande'
  get  '/commande/:user_id/modifier', to: 'accueil#modifier_commande', as: 'modifier_commande'
  root to: 'accueil#index'
end
