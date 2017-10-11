class Commande < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :plat

  def self.annuler(user_id)
    where(utilisateur_id: user_id, date: Date.today)
      .update(annulee: true)
  end
end
