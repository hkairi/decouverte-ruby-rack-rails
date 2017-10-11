module AccueilHelper

  def peut_commander?(user, plats)
    time = Time.now
    heure_passee = ((time.hour > 9 ||( time.hour >= 9 && time.min > 30)))
    not (plats.empty? || commandeService.a_deja_commande?(user['id']).value || heure_passee)
  end

  def pourquoi_je_ne_peux_pas_commander?(user, plats)
    msg = ''
    msg << "Les plats ne sont pas disponibles" if plats.empty?
    res = commandeService.a_deja_commande?(user['id'])

    msg << "Vous avez déjà commandé le plat '#{res.details}'." if res.value
  end

  def commandeService
    service ||= CommandeService.new
  end
end
