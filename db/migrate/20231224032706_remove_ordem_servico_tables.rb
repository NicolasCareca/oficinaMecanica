class RemoveOrdemServicoTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :ordem_servico_items, if_exists: true
    drop_table :ordem_servicos_pecas, if_exists: true
    drop_table :ordem_de_servicos, if_exists: true
  end
end
