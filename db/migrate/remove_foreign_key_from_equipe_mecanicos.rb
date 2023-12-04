class RemoveForeignKeyFromEquipeMecanicos
   < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :equipe_mecanicos, :mecanicos
  end
end
