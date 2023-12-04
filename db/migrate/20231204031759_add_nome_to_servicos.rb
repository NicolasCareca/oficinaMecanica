class AddNomeToServicos < ActiveRecord::Migration[7.1]
  def change
    add_column :servicos, :nome, :string
  end
end
