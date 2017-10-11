class CommandeService
  Reponse = Struct.new(:value, :details)

  def creer(plat_id, user_id)
    Commande.create(plat_id: plat_id,
                    utilisateur_id: user_id,
                    date: Date.today)
  end

  def a_deja_commande?(user_id, date = Date.today)
    res = Commande.includes(:plat)
                  .where(utilisateur_id: user_id, date: date)
                  .first

    Reponse.new( not(res.nil?), res.try(:plat).try(:nom) )
  end

  def commandes_du_jour(date = Date.today)
    liste = Commande.includes(:plat, :utilisateur)
                    .where(date: date)
                    .all

    res = {}

    liste.each do |commande|
      res[commande.plat.nom] = res[commande.plat.nom] || []
      res[commande.plat.nom] << commande.utilisateur.nom
    end

    Reponse.new(date, res)
  end

  def count(commandes)
    commandes.map { |k, v| v.size }.flatten.reduce(:+)
  end

  def modifier(commande_id, plat_id)
  end

end
