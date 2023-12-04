class AddCorToVeiculos < ActiveRecord::Migration[7.1]
  def change
    add_column :veiculos, :cor, :string
  end
end
