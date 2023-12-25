class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  def index
    @clientes = if params[:search]
                  Cliente.where("nome LIKE ?", "%#{params[:search]}%")
                else
                  Cliente.all
                end

    @clientes = @clientes.order(:nome) if params[:order] == 'nome'
    @clientes = @clientes.order(created_at: :desc) if params[:order] == 'creation_date_desc'
    @clientes = @clientes.order(created_at: :asc) if params[:order] == 'creation_date_asc'

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @cliente = Cliente.find(params[:id])
    @clientes = [ @cliente ]
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy!

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nome, :telefone, :email, :rg, :cpf)
    end

end
