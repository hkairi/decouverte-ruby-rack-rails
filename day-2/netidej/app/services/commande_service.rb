class CommandeService

  def a_deja_commande?(user_id, date = Date.today)
    res = Commande.where(utilisateur_id: user_id, date: date).first
    not res.nil?
  end

  def creer(plat_id, user_id)
    Commande.create(plat_id: plat_id,
                    utilisateur_id: user_id,
                    date: Date.today)
  end

  def du_jour(date = Date.today)
    []
  end

  def modifier(commande_id, plat_id)
  end

end
