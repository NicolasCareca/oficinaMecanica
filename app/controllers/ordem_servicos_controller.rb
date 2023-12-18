# app/controllers/ordem_servicos_controller.rb
class OrdemServicosController < ApplicationController
  before_action :set_ordem_servico, only: [:show, :edit, :update, :destroy]
  before_action :load_associated_data, only: [:new, :edit]

  def index
    @ordem_servicos = OrdemServico.all
  end

  def show
  end

  def new
    @ordem_servico = OrdemServico.new
  end

  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)
    calculate_valor_total(@ordem_servico)
    if @ordem_servico.save
      redirect_to @ordem_servico, notice: 'Ordem de Serviço criada com sucesso.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ordem_servico.update(ordem_servico_params)
      calculate_valor_total(@ordem_servico)
      redirect_to @ordem_servico, notice: 'Ordem de Serviço atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @ordem_servico.destroy
    redirect_to ordem_servicos_url, notice: 'Ordem de Serviço excluída com sucesso.'
  end

  private

  def set_ordem_servico
    @ordem_servico = OrdemServico.find(params[:id])
  end

  def load_associated_data
    @veiculos = Veiculo.all
    @clientes = Cliente.all
    @servicos = Servico.all
    @pecas = Peca.all
    @equipes = Equipe.all
  end

  def ordem_servico_params
    params.require(:ordem_servico).permit(:veiculo_id, :problema_veiculo, :servico_id, :peca_id, :equipe_id, :valor)
    # Adicione os outros parâmetros necessários para a ordem de serviço (data, status, etc.)
  end

  def calculate_valor_total(ordem_servico)
    valor_total = 0

    # Adicione o valor das peças associadas à ordem de serviço
    valor_total += ordem_servico.peca&.preco.to_f if ordem_servico.peca

    # Adicione o valor do serviço associado à ordem de serviço
    valor_total += ordem_servico.servico&.valor.to_f if ordem_servico.servico

    ordem_servico.update(valor: valor_total)
  end
end
