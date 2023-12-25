class CreateOrdemServicoPecas < ActiveRecord::Migration[7.1]
  def change
    create_table :ordem_servico_pecas do |t|
      t.references :ordem_servico, null: false, foreign_key: true
      t.references :peca, null: false, foreign_key: true
      t.integer :quantidade

      t.timestamps
    end
  end
end
