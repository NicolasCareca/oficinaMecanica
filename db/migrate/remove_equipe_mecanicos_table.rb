class RemoveEquipeMecanicosTable < ActiveRecord::Migration[7.1]
  def change
    def up
      drop_table :equipe_mecanicos
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
