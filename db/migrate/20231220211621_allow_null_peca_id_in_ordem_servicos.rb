class AllowNullPecaIdInOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    change_column :ordem_servicos, :peca_id, :integer, null: true
  end
end
