class RemoveClienteFromOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    remove_reference :ordem_servicos, :cliente, null: false, foreign_key: true
  end
end
