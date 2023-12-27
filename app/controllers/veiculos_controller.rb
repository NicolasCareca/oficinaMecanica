class VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[show edit update destroy]
  before_action :load_clientes, only: %i[new edit]

  def index
    @veiculos = Veiculo.includes(:cliente).all
  end

  def show
    @veiculo = Veiculo.find(params[:id])
    @veiculos = [@veiculo]
    @cliente = @veiculo.cliente
  end

  def new
    @veiculo = Veiculo.new
  end

  def edit
  end

  def create
    Rails.logger.debug(params.inspect)
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to veiculo_url(@veiculo), notice: 'Veiculo criado com sucesso.' }
        format.json { render :show, status: :created, location: @veiculo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to veiculo_url(@veiculo), notice: 'Veiculo atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @veiculo.destroy!

    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: 'Veiculo deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end

  def load_clientes
    @clientes = Cliente.all
  end

  def veiculo_params
    params.require(:veiculo).permit(:modelo, :placa, :cor, :cliente_id, :ano)
  end
end
