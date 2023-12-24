class RemoveCodigoEnderecoAddTelefoneEmailToMecanicos < ActiveRecord::Migration[6.0]
  def change
    remove_column :mecanicos, :codigo, :integer
    remove_column :mecanicos, :endereco, :string
    add_column :mecanicos, :telefone, :string
    add_column :mecanicos, :email, :string
  end
end
