class CreateOrdemServicosPecas < ActiveRecord::Migration[7.1]
  def change
    create_table :ordem_servicos_pecas do |t|
      t.references :ordem_servico, null: false, foreign_key: true
      t.references :peca, null: false, foreign_key: true

      t.timestamps
    end
  end
end
