class AddServicoToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_reference :ordem_servicos, :servico, null: false, foreign_key: true
  end
end
