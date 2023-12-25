class OrdemServico < ApplicationRecord
  belongs_to :veiculo
  belongs_to :equipe

  has_many :ordem_servico_servicos, dependent: :destroy
  has_many :ordem_servico_pecas, dependent: :destroy

  accepts_nested_attributes_for :ordem_servico_servicos, allow_destroy: true
  accepts_nested_attributes_for :ordem_servico_pecas, allow_destroy: true

  has_many :servicos, through: :ordem_servico_servicos
  has_many :pecas, through: :ordem_servico_pecas

  validates :problema, presence: true
  validates :status, presence: false



  def calcular_valor_total
    total_servicos = servicos.sum(:valor)
    total_pecas = 0

    pecas.each do |peca|
      quantidade = quantidade_da_peca(peca)
      total_pecas += peca.preco * quantidade if quantidade.positive?
    end

    self.valor_total = total_servicos + total_pecas
  end

  def quantidade_da_peca(peca)
    ordem_servico_peca = ordem_servico_pecas.find_by(peca_id: peca.id)
    ordem_servico_peca&.quantidade.to_i
  end
  before_save :calcular_valor_total, if: -> { !valor_total_changed? }
  attr_accessor :valor_total_changed
end
