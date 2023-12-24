class Mecanico < ApplicationRecord
  belongs_to :equipe
  validates :especialidade, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
end
