class Cliente < ApplicationRecord
  has_many :veiculos
  attribute :cpf
  attribute :rg
  validates :cpf, presence: true
  validates :rg, presence: true
end
