# app/models/peca.rb
class Peca < ApplicationRecord
  has_and_belongs_to_many :ordem_servicos
  has_many :ordem_servicos_pecas, dependent: :destroy
  has_many :ordem_servicos, through: :ordem_servicos_pecas

  def self.total_em_estoque
    sum(:quantidade)
  end
end
