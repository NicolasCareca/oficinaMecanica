class AddNomeToPecas < ActiveRecord::Migration[7.1]
  def change
    add_column :pecas, :nome, :string
  end
end
