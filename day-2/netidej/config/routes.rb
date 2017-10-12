Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'

  resources :utilisateurs
  #resources :plats

  # connexion et déconnexion
  get '/deconnexion',to: 'accueil#logout', as: 'logout'
  get '/connexion',  to: 'accueil#login', as: 'login'
  post '/connexion', to: 'accueil#login'

  # API
  get '/api/v1/commandes', to: 'api#commandes'

  # commande
  post '/commander', to: 'accueil#commander', as: 'commande'
  get  '/commande/:user_id/annuler', to: 'accueil#annuler_commande', as: 'annuler_commande'
  get  '/commande/:user_id/modifier', to: 'accueil#modifier_commande', as: 'modifier_commande'
  root to: 'accueil#index'
end
