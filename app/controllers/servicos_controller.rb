class ServicosController < ApplicationController
  before_action :set_servico, only: %i[ show edit update destroy ]

  def index
    @servicos = Servico.all
  end

  def show
    @servico= Servico.find(params[:id])
    @servicos = [ @servico]
  end

  def new
    @servico = Servico.new
  end

  def edit
  end

  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to servicos_url, notice: "Servico criado com sucesso." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to servicos_url, notice: "Servico atualizado com sucesso." }

        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @servico.destroy!

    respond_to do |format|
      format.html { redirect_to servicos_url, notice: "Serviço destruido com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_servico
      @servico = Servico.find(params[:id])
    end

    def servico_params
      params.require(:servico).permit(:descricao, :nome, :valor)
    end
end
