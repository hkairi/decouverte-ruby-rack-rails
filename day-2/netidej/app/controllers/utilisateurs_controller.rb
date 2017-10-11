class UtilisateursController < ApplicationController
  before_action :set_utilisateur, only: [:show, :edit, :update, :destroy]

  before_action :verifie_que_le_gars_est_connecte, except: [:new, :create]

  # GET /utilisateurs
  # GET /utilisateurs.json
  def index
    @utilisateurs = Utilisateur.all
  end

  # GET /utilisateurs/1
  # GET /utilisateurs/1.json
  def show
  end

  # GET /utilisateurs/new
  def new
    @utilisateur = Utilisateur.new
  end

  # GET /utilisateurs/1/edit
  def edit
    redirect_to root_path unless this_user_is_me?(@utilisateur.id)
  end

  # POST /utilisateurs
  # POST /utilisateurs.json
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)

    respond_to do |format|
      if @utilisateur.save
        format.html { redirect_to @utilisateur, notice: 'Utilisateur créé' }
        format.json { render :show, status: :created, location: @utilisateur }
      else
        format.html { render :new }
        format.json { render json: @utilisateur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utilisateurs/1
  # PATCH/PUT /utilisateurs/1.json
  def update
    respond_to do |format|
      if @utilisateur.update(utilisateur_params)
        format.html { redirect_to @utilisateur, notice: 'Utilisateur was successfully updated.' }
        format.json { render :show, status: :ok, location: @utilisateur }
      else
        format.html { render :edit }
        format.json { render json: @utilisateur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utilisateurs/1
  # DELETE /utilisateurs/1.json
  def destroy
    @utilisateur.destroy
    respond_to do |format|
      format.html { redirect_to utilisateurs_url, notice: 'Utilisateur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utilisateur
      @utilisateur = Utilisateur.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utilisateur_params
      params.require(:utilisateur)
            .permit(:email, :nom, :password, :password_confirmation)
    end
end
