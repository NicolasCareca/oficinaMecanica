class OrdemServicosPeca < ApplicationRecord
  belongs_to :peca
  belongs_to :ordem_servico
end
