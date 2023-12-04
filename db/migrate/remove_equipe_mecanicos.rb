class RemoveEquipeMecanicos < ActiveRecord::Migration[7.1]
  def change
    drop_table :equipe_mecanicos
  end
end
