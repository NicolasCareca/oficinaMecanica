class AddEquipeRefToMecanicos < ActiveRecord::Migration[7.1]
  def change
    add_reference :mecanicos, :equipe, null: false, foreign_key: true
  end
end
