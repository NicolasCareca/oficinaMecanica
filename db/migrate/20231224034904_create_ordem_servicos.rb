class CreateOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    create_table :ordem_servicos do |t|
      t.references :veiculo, null: false, foreign_key: true
      t.references :equipe, null: false, foreign_key: true
      t.text :problema
      t.string :status

      t.timestamps
    end
  end
end
