# app/models/ordem_servico.rb

class OrdemServico < ApplicationRecord
  belongs_to :veiculo
  belongs_to :cliente
  belongs_to :servico
  belongs_to :peca, optional: true
  belongs_to :equipe

  validates :veiculo, :cliente, :servico, :equipe, presence: true
  validates :valor, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.total_ordens_servico
    count
  end
end
