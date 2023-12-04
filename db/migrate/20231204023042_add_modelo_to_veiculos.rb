class AddModeloToVeiculos < ActiveRecord::Migration[7.1]
  def change
    add_column :veiculos, :modelo, :string
  end
end
