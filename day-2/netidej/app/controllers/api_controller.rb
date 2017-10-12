class ApiController < ApplicationController

  def commandes
    commandes = commandeService.commandes_du_jour
    render json: commandes
  end

  private

  def commandeService
    service ||= CommandeService.new
  end

end
