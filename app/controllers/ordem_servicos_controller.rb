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

      # Certifique-se de que os IDs de peças e serviços existem
      peca_ids = Array(params[:ordem_servico][:peca_ids]).reject(&:blank?)
      servico_ids = Array(params[:ordem_servico][:servico_ids]).reject(&:blank?)

      # Adicione peças e serviços associados à ordem de serviço
      @ordem_servico.pecas << Peca.find(peca_ids) unless peca_ids.empty?
      @ordem_servico.servicos << Servico.find(servico_ids) unless servico_ids.empty?

      calculate_valor_total(@ordem_servico)

      if @ordem_servico.save
        redirect_to @ordem_servico, notice: 'Ordem de Serviço criada com sucesso.'
      else
        render :new
      end
    end
    def edit
    end

    def update_status
      @ordem_servico = OrdemServico.find(params[:id])
      new_status = params[:status]

      if @ordem_servico.update(status: new_status)
        redirect_to @ordem_servico, notice: 'Status atualizado com sucesso.'
      else
        render :edit
      end
    end

    def update
      # existing code...

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
      new_variable = @clientes = Cliente.all

      @servicos = Servico.all
      @pecas = Peca.all
      @equipes = Equipe.all
    end

    def ordem_servico_params
      params.require(:ordem_servico).permit(
        :veiculo_id,
        :problema_veiculo,
        :equipe_id,
        :valor,
        :status,
        servico_ids: [],
        peca_ids: []
      )
    end

    def calculate_valor_total(ordem_servico)
      valor_total = 0

      # Adicione o valor das peças associadas à ordem de serviço
      ordem_servico.pecas.each do |peca|
        valor_total += peca.preco.to_f
      end

      # Adicione o valor dos serviços associados à ordem de serviço
      ordem_servico.servicos.each do |servico|
        valor_total += servico.valor.to_f
      end

      ordem_servico.update(valor: valor_total)
    end
  end
