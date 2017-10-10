class AccueilController < ApplicationController

  def index
    @plats = Plat.du_jour
  end

  def commander
    if params[:plat]
      commandeService.creer(params[:plat][:plat_id], session[:user_id])
    end

    redirect_to root_path
  end

  def login
    if params[:utilisateur]
      email, password = params[:utilisateur][:email], params[:utilisateur][:password]
      user = Utilisateur.authenticate(email, password)

      if user
        session[:user_id]   = user.id
        session[:user_name] = user.email
        redirect_to root_path
      else
        @erreur = "Email ou mot de passe incorrect"
        render :login
      end
    end
  end

  def logout
    session[:user_id]   = nil
    session[:user_name] = nil
    redirect_to login_path
  end

  def commandeService
    service ||= CommandeService.new
    # memoization
  end

end
