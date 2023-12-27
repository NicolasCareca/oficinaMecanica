class Servico < ApplicationRecord

  validates :nome, presence: true
  validates :descricao, presence: true
  validates :valor, presence: true

end
