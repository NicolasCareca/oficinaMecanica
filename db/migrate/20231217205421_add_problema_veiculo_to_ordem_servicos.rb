class AddProblemaVeiculoToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_column :ordem_servicos, :problema_veiculo, :text
  end
end
