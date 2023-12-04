class CreateVeiculos < ActiveRecord::Migration[7.1]
  def change
    create_table :veiculos do |t|
      t.string :modelo
      t.string :placa
      t.string :cor
      t.integer :cliente_id  # Certifique-se de que esta linha está presente

      t.timestamps
    end
  end
end
