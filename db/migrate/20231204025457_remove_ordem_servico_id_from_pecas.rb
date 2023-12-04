class RemoveOrdemServicoIdFromPecas < ActiveRecord::Migration[7.1]
  def change
    remove_column :pecas, :ordem_servico_id, :integer
  end
end
