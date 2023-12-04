class RemoveForeignKeyFromEquipeMecanico < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :equipe_mecanicos, :equipes
  end
end
