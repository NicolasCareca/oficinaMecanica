class Cliente < ApplicationRecord
  has_many :veiculos
  validates :nome, presence: true
  validates :telefone, presence: true
  validates :cpf, presence: true
  validates :rg, presence: true
  validates :email, presence: true
end
