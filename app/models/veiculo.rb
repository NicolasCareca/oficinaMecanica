class Veiculo < ApplicationRecord
  belongs_to :cliente
  has_many :ordem_servicos
  validates :modelo, presence: true
  validates :placa, presence: true
  validates :cor, presence: true
  validates :cliente_id, presence: true
  validates :ano, presence: true
end
