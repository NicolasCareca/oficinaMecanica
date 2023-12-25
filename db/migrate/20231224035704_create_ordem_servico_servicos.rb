class CreateOrdemServicoServicos < ActiveRecord::Migration[7.1]
  def change
    create_table :ordem_servico_servicos do |t|
      t.references :ordem_servico, null: false, foreign_key: true
      t.references :servico, null: false, foreign_key: true

      t.timestamps
    end
  end
end
