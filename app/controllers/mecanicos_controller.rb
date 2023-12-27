class MecanicosController < ApplicationController
  before_action :set_mecanico, only: %i[ show edit update destroy ]

  def index
    @mecanicos = Mecanico.all
    @equipes = Equipe.all
  end


  def show
    @mecanico = Mecanico.find(params[:id])
    @mecanicos = [ @mecanico ]
  end

  def new
    @mecanico = Mecanico.new
  end

  def edit
  end

  def create
    @mecanico = Mecanico.new(mecanico_params)

    respond_to do |format|
      if @mecanico.save
        format.turbo_stream { redirect_to @mecanico, notice: 'Mecanico criado com sucesso.' }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mecanico.update(mecanico_params)
        format.html { redirect_to mecanico_url(@mecanico), notice: "Mecanico atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @mecanico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mecanico.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mecanico.destroy!

    respond_to do |format|
      format.html { redirect_to mecanicos_url, notice: "Mecanico deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_mecanico
      @mecanico = Mecanico.find(params[:id])
    end

    def mecanico_params
      params.require(:mecanico).permit(:nome, :especialidade, :telefone, :email, :equipe_id)
    end
end
