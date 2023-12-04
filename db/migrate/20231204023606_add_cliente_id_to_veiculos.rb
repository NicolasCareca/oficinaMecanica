class AddClienteIdToVeiculos < ActiveRecord::Migration[7.1]
  def change
    add_column :veiculos, :cliente_id, :integer
  end
end
