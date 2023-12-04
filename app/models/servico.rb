class Servico < ApplicationRecord
  has_many :ordens_de_servico
  validates :nome, presence: true
  validates :valor, presence: true
end
