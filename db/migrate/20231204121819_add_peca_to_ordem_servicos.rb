class AddPecaToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_reference :ordem_servicos, :peca, null: false, foreign_key: true
  end
end
