class VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[show edit update destroy]
  before_action :load_clientes, only: %i[new edit]

  # GET /veiculos or /veiculos.json
  def index
    @veiculos = Veiculo.includes(:cliente).all
  end

  # GET /veiculos/1 or /veiculos/1.json
  def show
    @veiculo = Veiculo.find(params[:id])
    @veiculos = [ @veiculo]
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos or /veiculos.json
  def create
    Rails.logger.debug(params.inspect)
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to veiculo_url(@veiculo), notice: 'Veiculo was successfully created.' }
        format.json { render :show, status: :created, location: @veiculo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculos/1 or /veiculos/1.json
  def update
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to veiculo_url(@veiculo), notice: 'Veiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1 or /veiculos/1.json
  def destroy
    @veiculo.destroy!

    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: 'Veiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end

  def load_clientes
    @clientes = Cliente.all
  end

  # Only allow a list of trusted parameters through.
  def veiculo_params
    params.require(:veiculo).permit(:modelo, :placa, :cor, :cliente_id)
  end
end
