class AddStatusToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_column :ordem_servicos, :status, :string
  end
end
