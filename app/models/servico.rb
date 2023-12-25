class Servico < ApplicationRecord
  validates :nome, presence: true
  validates :descricao, presence: true
  validates :valor, presence: true
  belongs_to :servico
end
