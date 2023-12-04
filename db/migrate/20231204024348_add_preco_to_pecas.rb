class AddPrecoToPecas < ActiveRecord::Migration[7.1]
  def change
    add_column :pecas, :preco, :decimal
  end
end
