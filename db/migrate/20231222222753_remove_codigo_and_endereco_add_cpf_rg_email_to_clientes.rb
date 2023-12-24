class RemoveCodigoAndEnderecoAddCpfRgEmailToClientes < ActiveRecord::Migration[7.1]
  def change
    remove_column :clientes, :codigo, :integer
    remove_column :clientes, :endereco, :string
    add_column :clientes, :cpf, :string
    add_column :clientes, :rg, :string
    add_column :clientes, :email, :string
  end
end
