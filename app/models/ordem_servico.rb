
# app/models/ordem_servico.rb
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

  before_save :calcular_valor_total
  def calcular_valor_total
    total_servicos = servicos.sum(:valor)
    total_pecas = pecas.sum { |peca| peca.preco * quantidade_da_peca(peca) }

    puts "Debug: total_servicos=#{total_servicos}, total_pecas=#{total_pecas}"

    self.valor_total = total_servicos + total_pecas
    puts "Debug: valor_total=#{self.valor_total}"
  end


  private

  def quantidade_da_peca(peca)
    # Obtém a quantidade da peça associada à ordem de serviço
    ordem_servico_peca = ordem_servico_pecas.find_by(peca_id: peca.id)
    ordem_servico_peca&.quantidade.to_i
  end
end
