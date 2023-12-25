class AddValorTotalToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_column :ordem_servicos, :valor_total, :decimal
  end
end
