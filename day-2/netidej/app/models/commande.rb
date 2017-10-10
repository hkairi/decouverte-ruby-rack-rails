class Commande < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :plat
end
