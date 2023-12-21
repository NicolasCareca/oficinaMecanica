class RemoveStatusFromOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    remove_column :ordem_servicos, :status, :string
  end
end
