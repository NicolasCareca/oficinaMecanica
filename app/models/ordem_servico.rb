# app/models/ordem_servico.rb
class OrdemServico < ApplicationRecord
  has_many :ordem_servico_items
  has_many :pecas, through: :ordem_servico_items
  has_many :servicos, through: :ordem_servico_items
  belongs_to :veiculo
  belongs_to :equipe

  accepts_nested_attributes_for :ordem_servico_items, allow_destroy: true

  validates :veiculo, :equipe, presence: true
  validates :valor, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :problema_veiculo, presence: true

  # Adicione a validação para o atributo status
  validates :status, presence: true

  def self.total_ordens_servico
    count
  end
end
