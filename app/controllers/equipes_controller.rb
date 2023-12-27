class EquipesController < ApplicationController
  before_action :set_equipe, only: %i[ show edit update destroy ]

  def index
    @equipes = Equipe.all
  end

  def show
    @equipe = Equipe.find(params[:id])
    @equipes = [ @equipe ]
  end

  def new
    @equipe = Equipe.new
  end

  def edit
    @equipe = Equipe.find(params[:id])
  end

  def create
    @equipe = Equipe.new(equipe_params)

    respond_to do |format|
      if @equipe.save
        format.html { redirect_to @equipe, notice: "Equipe criado com sucesso." }
        format.json { render :show, status: :created, location: @equipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @equipe.update(equipe_params)
        format.html { redirect_to equipe_url(@equipe), notice: "Equipe atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @equipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @equipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipe.destroy!

    respond_to do |format|
      format.html { redirect_to equipes_url, notice: "Equipe deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    def set_equipe
      @equipe = Equipe.find(params[:id])
    end

    def equipe_params
      params.require(:equipe).permit(:nome, :descricao)
    end
end
