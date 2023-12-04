class Mecanico < ApplicationRecord
  belongs_to :equipe
  attribute :funcao
  validates :especialidade, presence: true
end
