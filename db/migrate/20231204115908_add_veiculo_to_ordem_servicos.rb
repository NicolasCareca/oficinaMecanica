class AddVeiculoToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_reference :ordem_servicos, :veiculo, null: false, foreign_key: true
  end
end
