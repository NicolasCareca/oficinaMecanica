class RemoveOrdemServicoIdFromServicos < ActiveRecord::Migration[7.1]
  def change
    remove_column :servicos, :ordem_servico_id, :integer
  end
end
