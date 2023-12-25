class Veiculo < ApplicationRecord
  belongs_to :cliente
  has_one :ordem_servico

  validates :modelo, presence: true
  validates :placa, presence: true, uniqueness: true
  validates :cor, presence: true
  validates :cliente_id, presence: true
  validates :ano, presence: true
end
