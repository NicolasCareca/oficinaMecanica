# app/models/peca.rb
class Peca < ApplicationRecord
  has_many :ordem_servico_pecas
  has_many :ordem_servicos, through: :ordem_servico_pecas
  def self.total_em_estoque
    sum(:quantidade)
  end
end
