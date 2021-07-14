class CadastresController < ApplicationController
  before_action :set_cadastre, only: %i[ show edit update destroy ]

  # GET /cadastres or /cadastres.json
  def index
    @cadastres = Cadastre.all
  end

  # GET /cadastres/1 or /cadastres/1.json
  def show
  end

  # GET /cadastres/new
  def new
    @cadastre = Cadastre.new
  end

  # GET /cadastres/1/edit
  def edit
  end

  # POST /cadastres or /cadastres.json
  def create
    @cadastre = Cadastre.new(cadastre_params)

    respond_to do |format|
      if @cadastre.save
        format.html { redirect_to @cadastre, notice: "Cadastre was successfully created." }
        format.json { render :show, status: :created, location: @cadastre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cadastre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cadastres/1 or /cadastres/1.json
  def update
    respond_to do |format|
      if @cadastre.update(cadastre_params)
        format.html { redirect_to @cadastre, notice: "Cadastre was successfully updated." }
        format.json { render :show, status: :ok, location: @cadastre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cadastre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadastres/1 or /cadastres/1.json
  def destroy
    @cadastre.destroy
    respond_to do |format|
      format.html { redirect_to cadastres_url, notice: "Cadastre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cadastre
      @cadastre = Cadastre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cadastre_params
      params.require(:cadastre).permit(:name, :cpf, :phone)
    end
end
