# app/controllers/ordem_servicos_controller.rb
class OrdemServicosController < ApplicationController
  before_action :set_ordem_servico, only: [:show, :edit, :update, :destroy, :concluir]

  def index
    @ordem_servicos = OrdemServico.all
  end

  def show
    # Adicione aqui qualquer lógica adicional necessária para exibir uma ordem de serviço
  end

  def new
    @ordem_servico = OrdemServico.new
    @servicos = Servico.all
    @pecas = Peca.all
    @veiculos = Veiculo.all
    @equipes = Equipe.all
    @ordem_servico.ordem_servico_servicos.build
    @ordem_servico.ordem_servico_pecas.build
  end

  def create
    @ordem_servico = OrdemServico.new(ordem_servico_params)

    puts "Debug: ordem_servico_params=#{ordem_servico_params}"

    if @ordem_servico.save
      redirect_to ordem_servicos_path, notice: 'Ordem de Serviço criada com sucesso.'
    else
      @servicos = Servico.all
      @veiculos = Veiculo.all
      @equipes = Equipe.all
      render :new
    end
  end

  def edit
    @servicos = Servico.all
    @equipes = Equipe.all
  end

  def update
    params[:ordem_servico].delete(:veiculo_id) if params[:ordem_servico][:veiculo_id].present?

    if @ordem_servico.update(ordem_servico_params)
      redirect_to ordem_servicos_path, notice: 'Ordem de Serviço atualizada com sucesso.'
    else
      @servicos = Servico.all
      @veiculos = Veiculo.all
      @equipes = Equipe.all
      render :edit
    end
  end

  def destroy
    @ordem_servico.destroy
    redirect_to ordem_servicos_path, notice: 'Ordem de Serviço excluída com sucesso.'
  end

  def concluir
    @ordem_servico.update(status: 'Concluída')
    redirect_to ordem_servicos_path, notice: 'Ordem de Serviço concluída com sucesso.'
  end

  private

  def set_ordem_servico
    @ordem_servico = OrdemServico.find(params[:id])
  end

  def ordem_servico_params
    params.require(:ordem_servico).permit(
      :veiculo_id,
      :equipe_id,
      :problema,
      :status,  # Add this line
      ordem_servico_servicos_attributes: [:id, :servico_id, :_destroy],
      ordem_servico_pecas_attributes: [:id, :peca_id, :quantidade, :_destroy]
    )
  end
end
