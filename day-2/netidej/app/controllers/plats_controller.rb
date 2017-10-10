class PlatsController < ApplicationController
  before_action :set_plat, only: [:show, :edit, :update, :destroy]

  # GET /plats
  # GET /plats.json
  def index
    @plats = Plat.all
  end

  # GET /plats/1
  # GET /plats/1.json
  def show
  end

  # GET /plats/new
  def new
    @plat = Plat.new
  end

  # GET /plats/1/edit
  def edit
  end

  # POST /plats
  # POST /plats.json
  def create
    @plat = Plat.new(plat_params)

    respond_to do |format|
      if @plat.save
        format.html { redirect_to @plat, notice: 'Plat ajouté' }
        format.json { render :show, status: :created, location: @plat }
      else
        format.html { render :new }
        format.json { render json: @plat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plats/1
  # PATCH/PUT /plats/1.json
  def update
    respond_to do |format|
      if @plat.update(plat_params)
        format.html { redirect_to @plat, notice: 'Plat modifié' }
        format.json { render :show, status: :ok, location: @plat }
      else
        format.html { render :edit }
        format.json { render json: @plat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plats/1
  # DELETE /plats/1.json
  def destroy
    @plat.destroy
    respond_to do |format|
      format.html { redirect_to plats_url, notice: 'Plat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plat
      @plat = Plat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plat_params
      params.require(:plat).permit(:nom, :date)
    end
end
