class Equipe < ApplicationRecord
  has_many :mecanicos
  has_many :ordem_servicos
  attribute :descricao, :string
end
