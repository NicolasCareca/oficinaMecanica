class CreatePecas < ActiveRecord::Migration[7.1]
  def change
    create_table :pecas do |t|
      t.string :nome
      t.integer :quantidade
      t.decimal :preco

      t.timestamps
    end
  end
end
end
