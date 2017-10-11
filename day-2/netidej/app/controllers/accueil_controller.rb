class AccueilController < ApplicationController

  def index
    @plats           = Plat.du_jour
    @commandes       = commandeService.commandes_du_jour(Date.today).details
    @commandes_count = commandeService.count(@commandes)
  end

  def commander
    if params[:plat]
      commandeService.creer(params[:plat][:plat_id], current_user['id'])
    end

    redirect_to root_path
  end

  def login
    if params[:utilisateur]
      email, password = params[:utilisateur][:email], params[:utilisateur][:password]
      user = Utilisateur.authenticate(email, password)

      if user
        session[:user] = user
        redirect_to root_path
      else
        @erreur = "Email ou mot de passe incorrect"
        render :login
      end
    end
  end

  def logout
    session[:user]   = nil
    redirect_to login_path
  end

  def commandeService
    service ||= CommandeService.new
    # memoization
  end

end
