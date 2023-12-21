# app/models/ordem_servico_item.rb
class OrdemServicoItem < ApplicationRecord
  belongs_to :ordem_servico
  belongs_to :peca
  belongs_to :servico
end
