class PecasController < ApplicationController
  before_action :set_peca, only: %i[ show edit update destroy ]

  def index
    @pecas = Peca.all
  end

  def show

      @peca = Peca.find(params[:id])
      @pecas = [ @peca]
  end

  def new
    @peca = Peca.new
  end

  def edit
    @peca = Peca.find(params[:id])
  end


  def create
    @peca = Peca.new(peca_params)

    respond_to do |format|
      if @peca.save
        format.turbo_stream { redirect_to pecas_url, notice: "Peca criada com sucesso." }
        format.html { redirect_to pecas_url, notice: "Peca criado com sucesso." }
        format.json { render :index, status: :created, location: @peca }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @peca.update(peca_params)
        format.html { redirect_to peca_url(@peca), notice: "Peca atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @peca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @peca.destroy!

    respond_to do |format|
      format.html { redirect_to pecas_url, notice: "Peca deletada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_peca
      @peca = Peca.find(params[:id])
    end

    def peca_params
      params.require(:peca).permit(:nome, :descricao, :quantidade, :preco)
    end
end
