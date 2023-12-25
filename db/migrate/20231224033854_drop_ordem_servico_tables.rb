class DropOrdemServicoTables < ActiveRecord::Migration[7.1]
  def change
    drop_table "ordem_servico_equipes", if_exists: true
    drop_table "ordem_servico_pecas", if_exists: true
    drop_table "ordem_servico_servicos", if_exists: true
  end
end
