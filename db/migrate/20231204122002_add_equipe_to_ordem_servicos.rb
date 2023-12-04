class AddEquipeToOrdemServicos < ActiveRecord::Migration[7.1]
  def change
    add_reference :ordem_servicos, :equipe, null: false, foreign_key: true
  end
end
