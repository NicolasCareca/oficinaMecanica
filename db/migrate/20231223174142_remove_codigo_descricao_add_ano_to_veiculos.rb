class RemoveCodigoDescricaoAddAnoToVeiculos < ActiveRecord::Migration[6.0]
  def change
    remove_column :veiculos, :codigo, :integer
    remove_column :veiculos, :descricao, :string
    add_column :veiculos, :ano, :integer
  end
end
