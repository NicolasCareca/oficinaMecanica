class OrdemServicoPeca < ApplicationRecord
  belongs_to :ordem_servico
  belongs_to :peca
  validates :quantidade, presence: true

end
