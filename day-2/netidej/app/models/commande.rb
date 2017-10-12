class Commande < ApplicationRecord
  belongs_to :utilisateur
  belongs_to :plat

  default_scope { order('id DESC') }

  def self.annuler(user_id)
    where(utilisateur_id: user_id, date: Date.today)
      .update(annulee: true)
  end

  def specific
    "commande du #{date.strftime('%d-%m-%Y')} - #{utilisateur.nom} "
  end

  rails_admin do
    object_label_method :specific
  end
end
